; DESCRIPTION: Draws a red rectangle at the screen with fixed size.

; Pixel-LLM generated: Draw a red pixel
LDI r9, 0x00FF00
LDI r11, 0x0000FF00  ; purple
RECTF r11, r4, r0, r1, r9
LDI r4, 1
LDI r0, 0x4444
LDI r0, 0xFFFFFF
RECTF r0, r1, r1, r1, r5
LDI r20, BUF
LDI r20, TXT_BUF
RECTF r9, r11, r4, r5
LDI r9, 231
LDI r11, 16
LDI r4, 256
LDI r1, 24
LDI r1, 30
RECTF r9, r11, r4, r0, r1
LDI r20, BUF
LDI r20, TXT_BUF
STRO r20, "Size: 8x8"
LDI r11, 1000
TEXT r8, r9, r11, r4, r0
HALT
