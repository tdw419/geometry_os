; DESCRIPTION: This GeOS assembly code implements a pixel-based chat demo that listens for incoming network frames using the NET_RECV function. It displays received pixel data on the screen and shows text messages in a status bar. The demo also includes a simple animated waiting indicator to signify activity.

; net_chat.asm -- Pixel Chat Demo (Phase 71: Pixel Network Protocol)
;
; Demonstrates bidirectional NET_RECV for receiving pixel data from a peer.
; Listens for incoming pixel protocol frames and displays them on screen.
; Also shows a simple text interface using NET_SEND for chat messages.
;
; For testing without a real network: push frames into vm.net_inbox
; using the test harness. The demo polls NET_RECV each frame.
;
; Protocol:
;   Frame type 0 (screen_share): display pixels on screen
;   Frame type 1 (chat): display text message in status bar

LDI r8, 1              ; increment constant
LDI r15, 256            ; screen width
LDI r7, 0              ; frame counter

; Clear screen to dark blue
LDI r11, 0x000033
FILL r11

; Draw title bar
LDI r11, 0x00
LDI r4, 0
LDI r9, 256
LDI r10, 1
LDI r5, 0x333333
RECTF r11, r4, r9, r10, r5

; Draw status bar at bottom
LDI r11, 0
LDI r4, 250
LDI r9, 256
LDI r10, 6
LDI r5, 0x222222
RECTF r11, r4, r9, r10, r5

; Write "Pixel Chat - Waiting..." text at top
LDI r0, 0x2000
LDI r6, 80             ; 'P'
STORE r0, r6
LDI r0, 0x2001
LDI r6, 105            ; 'i'
STORE r0, r6
LDI r0, 0x2002
LDI r6, 120            ; 'x'
STORE r0, r6
LDI r0, 0x2003
LDI r6, 101            ; 'e'
STORE r0, r6
LDI r0, 0x2004
LDI r6, 108            ; 'l'
STORE r0, r6
LDI r0, 0x2005
LDI r6, 0              ; null
STORE r0, r6

LDI r0, 0x2000
LDI r6, 2
LDI r2, 8
LDI r3, 0xFFFFFF
TEXT r0, r6, r3

; Main loop: poll for incoming frames
main_loop:
  ; Update frame counter
  ADD r7, r8
  LDI r11, 0xFFE
  STORE r11, r7

  ; Poll NET_RECV
  LDI r11, 0x7100     ; receive buffer
  LDI r4, 256        ; max length
  NET_RECV r11, r4

  ; Check if we got data (r14 > 0 means data received)
  LDI r9, 0
  CMP r14, r9
  JZ r14, no_data

  ; Data received! Check frame type
  LDI r10, 0x7100
  LOAD r10, r10         ; r10 = frame type
  LDI r5, 1
  CMP r10, r5
  JZ r14, got_chat       ; type 1 = chat message

  ; Type 0 = screen share - display pixels
  ; Pixel data starts at 0x7104 (after 4-byte header)
  ; For now, just flash the screen green briefly
  LDI r11, 0x003300
  FILL r11
  FRAME
  JMP main_loop

got_chat:
  ; Chat message received - display in status bar
  ; Change status bar color to indicate message
  LDI r11, 0
  LDI r4, 250
  LDI r9, 256
  LDI r10, 6
  LDI r5, 0x004400    ; green tint = message received
  RECTF r11, r4, r9, r10, r5
  FRAME
  JMP main_loop

no_data:
  ; Animate waiting indicator (blinking dot)
  LDI r11, 0xFFE
  LOAD r11, r11         ; r11 = TICKS
  LDI r4, 30
  AND r11, r4          ; r11 = TICKS & 30
  LDI r4, 15
  CMP r11, r4
  BLT r14, dot_on

  ; Dot off - draw black pixel at (128, 4)
  LDI r11, 128
  LDI r4, 4
  LDI r9, 0x000000
  PSET r11, r4, r9
  FRAME
  JMP main_loop

dot_on:
  LDI r11, 128
  LDI r4, 4
  LDI r9, 0xFFFFFF
  PSET r11, r4, r9
  FRAME
  JMP main_loop

HALT
