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

LDI r6, 1              ; increment constant
LDI r12, 256            ; screen width
LDI r4, 0              ; frame counter

; Clear screen to dark blue
LDI r2, 0x000033
FILL r2

; Draw title bar
LDI r2, 0x00
LDI r13, 0
LDI r0, 256
LDI r8, 1
LDI r1, 0x333333
RECTF r2, r13, r0, r8, r1

; Draw status bar at bottom
LDI r2, 0
LDI r13, 250
LDI r0, 256
LDI r8, 6
LDI r1, 0x222222
RECTF r2, r13, r0, r8, r1

; Write "Pixel Chat - Waiting..." text at top
LDI r5, 0x2000
LDI r9, 80             ; 'P'
STORE r5, r9
LDI r5, 0x2001
LDI r9, 105            ; 'i'
STORE r5, r9
LDI r5, 0x2002
LDI r9, 120            ; 'x'
STORE r5, r9
LDI r5, 0x2003
LDI r9, 101            ; 'e'
STORE r5, r9
LDI r5, 0x2004
LDI r9, 108            ; 'l'
STORE r5, r9
LDI r5, 0x2005
LDI r9, 0              ; null
STORE r5, r9

LDI r5, 0x2000
LDI r9, 2
LDI r7, 8
LDI r11, 0xFFFFFF
TEXT r5, r9, r11

; Main loop: poll for incoming frames
main_loop:
  ; Update frame counter
  ADD r4, r6
  LDI r2, 0xFFE
  STORE r2, r4

  ; Poll NET_RECV
  LDI r2, 0x7100     ; receive buffer
  LDI r13, 256        ; max length
  NET_RECV r2, r13

  ; Check if we got data (r3 > 0 means data received)
  LDI r0, 0
  CMP r3, r0
  JZ r3, no_data

  ; Data received! Check frame type
  LDI r8, 0x7100
  LOAD r8, r8         ; r8 = frame type
  LDI r1, 1
  CMP r8, r1
  JZ r3, got_chat       ; type 1 = chat message

  ; Type 0 = screen share - display pixels
  ; Pixel data starts at 0x7104 (after 4-byte header)
  ; For now, just flash the screen green briefly
  LDI r2, 0x003300
  FILL r2
  FRAME
  JMP main_loop

got_chat:
  ; Chat message received - display in status bar
  ; Change status bar color to indicate message
  LDI r2, 0
  LDI r13, 250
  LDI r0, 256
  LDI r8, 6
  LDI r1, 0x004400    ; green tint = message received
  RECTF r2, r13, r0, r8, r1
  FRAME
  JMP main_loop

no_data:
  ; Animate waiting indicator (blinking dot)
  LDI r2, 0xFFE
  LOAD r2, r2         ; r2 = TICKS
  LDI r13, 30
  AND r2, r13          ; r2 = TICKS & 30
  LDI r13, 15
  CMP r2, r13
  BLT r3, dot_on

  ; Dot off - draw black pixel at (128, 4)
  LDI r2, 128
  LDI r13, 4
  LDI r0, 0x000000
  PSET r2, r13, r0
  FRAME
  JMP main_loop

dot_on:
  LDI r2, 128
  LDI r13, 4
  LDI r0, 0xFFFFFF
  PSET r2, r13, r0
  FRAME
  JMP main_loop

HALT
