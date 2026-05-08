; DESCRIPTION: A red rectangle centered at the screen with fixed size.

; Pixel-LLM generated: Draw a red pixel
LDI r15, 0x00FF00
LDI r4, 0x0000FF00  ; purple
RECTF r4, r8, r13, r9, r15
LDI r8, 1
LDI r13, 0x4444
LDI r13, 0xFFFFFF
RECTF r13, r9, r9, r9, r5
LDI r20, BUF
LDI r20, TXT_BUF
RECTF r15, r4, r8, r5
LDI r15, 231
LDI r4, 16
LDI r8, 256
LDI r9, 24
LDI r9, 30
RECTF r15, r4, r8, r13, r9
LDI r20, BUF
LDI r20, TXT_BUF
STRO r20, "Size: 8x8"
LDI r4, 1000
TEXT r11, r15, r4, r8, r13
HALT
