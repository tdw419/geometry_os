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

LDI r2, 1              ; increment constant
LDI r15, 256            ; screen width
LDI r14, 0              ; frame counter

; Clear screen to dark blue
LDI r11, 0x000033
FILL r11

; Draw title bar
LDI r11, 0x00
LDI r9, 0
LDI r1, 256
LDI r4, 1
LDI r0, 0x333333
RECTF r11, r9, r1, r4, r0

; Draw status bar at bottom
LDI r11, 0
LDI r9, 250
LDI r1, 256
LDI r4, 6
LDI r0, 0x222222
RECTF r11, r9, r1, r4, r0

; Write "Pixel Chat - Waiting..." text at top
LDI r8, 0x2000
LDI r3, 80             ; 'P'
STORE r8, r3
LDI r8, 0x2001
LDI r3, 105            ; 'i'
STORE r8, r3
LDI r8, 0x2002
LDI r3, 120            ; 'x'
STORE r8, r3
LDI r8, 0x2003
LDI r3, 101            ; 'e'
STORE r8, r3
LDI r8, 0x2004
LDI r3, 108            ; 'l'
STORE r8, r3
LDI r8, 0x2005
LDI r3, 0              ; null
STORE r8, r3

LDI r8, 0x2000
LDI r3, 2
LDI r10, 8
LDI r6, 0xFFFFFF
TEXT r8, r3, r6

; Main loop: poll for incoming frames
main_loop:
  ; Update frame counter
  ADD r14, r2
  LDI r11, 0xFFE
  STORE r11, r14

  ; Poll NET_RECV
  LDI r11, 0x7100     ; receive buffer
  LDI r9, 256        ; max length
  NET_RECV r11, r9

  ; Check if we got data (r5 > 0 means data received)
  LDI r1, 0
  CMP r5, r1
  JZ r5, no_data

  ; Data received! Check frame type
  LDI r4, 0x7100
  LOAD r4, r4         ; r4 = frame type
  LDI r0, 1
  CMP r4, r0
  JZ r5, got_chat       ; type 1 = chat message

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
  LDI r9, 250
  LDI r1, 256
  LDI r4, 6
  LDI r0, 0x004400    ; green tint = message received
  RECTF r11, r9, r1, r4, r0
  FRAME
  JMP main_loop

no_data:
  ; Animate waiting indicator (blinking dot)
  LDI r11, 0xFFE
  LOAD r11, r11         ; r11 = TICKS
  LDI r9, 30
  AND r11, r9          ; r11 = TICKS & 30
  LDI r9, 15
  CMP r11, r9
  BLT r5, dot_on

  ; Dot off - draw black pixel at (128, 4)
  LDI r11, 128
  LDI r9, 4
  LDI r1, 0x000000
  PSET r11, r9, r1
  FRAME
  JMP main_loop

dot_on:
  LDI r11, 128
  LDI r9, 4
  LDI r1, 0xFFFFFF
  PSET r11, r9, r1
  FRAME
  JMP main_loop

HALT
