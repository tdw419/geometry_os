; DESCRIPTION: Draws a red rectangle at the screen with fixed size.

; Pixel-LLM generated: Draw a red pixel
LDI r6, 0x00FF00
LDI r14, 0x0000FF00  ; purple
RECTF r14, r1, r15, r2, r6
LDI r1, 1
LDI r15, 0x4444
LDI r15, 0xFFFFFF
RECTF r15, r2, r2, r2, r4
LDI r20, BUF
LDI r20, TXT_BUF
RECTF r6, r14, r1, r4
LDI r6, 231
LDI r14, 16
LDI r1, 256
LDI r2, 24
LDI r2, 30
RECTF r6, r14, r1, r15, r2
LDI r20, BUF
LDI r20, TXT_BUF
STRO r20, "Size: 8x8"
LDI r14, 1000
TEXT r7, r6, r14, r1, r15
HALT
