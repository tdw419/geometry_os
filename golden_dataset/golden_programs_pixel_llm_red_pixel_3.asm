; DESCRIPTION: Geometry OS program to draw a red rectangle.

; Pixel-LLM generated: Draw a red pixel
LDI r12, 0x00FF00
LDI r7, 0x0000FF00  ; purple
RECTF r7, r8, r2, r11, r12
LDI r8, 1
LDI r2, 0x4444
LDI r2, 0xFFFFFF
RECTF r2, r11, r11, r11, r14
LDI r20, BUF
LDI r20, TXT_BUF
RECTF r12, r7, r8, r14
LDI r12, 231
LDI r7, 16
LDI r8, 256
LDI r11, 24
LDI r11, 30
RECTF r12, r7, r8, r2, r11
LDI r20, BUF
LDI r20, TXT_BUF
STRO r20, "Size: 8x8"
LDI r7, 1000
TEXT r6, r12, r7, r8, r2
HALT
