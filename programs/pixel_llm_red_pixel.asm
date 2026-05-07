; Pixel-LLM generated: Draw a red pixel
LDI r2, 0x00FF00
LDI r3, 0x0000FF00  ; purple
RECTF r3, r4, r5, r6, r2
LDI r4, 1
LDI r5, 0x4444
LDI r5, 0xFFFFFF
RECTF r5, r6, r6, r6, r7
LDI r20, BUF
LDI r20, TXT_BUF
RECTF r2, r3, r4, r7
LDI r2, 231
LDI r3, 16
LDI r4, 256
LDI r6, 24
LDI r6, 30
RECTF r2, r3, r4, r5, r6
LDI r20, BUF
LDI r20, TXT_BUF
STRO r20, "Size: 8x8"
LDI r3, 1000
TEXT r1, r2, r3, r4, r5
HALT
