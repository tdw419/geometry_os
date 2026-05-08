; DESCRIPTION: Draw rectangle: pos=the screen, color=red, size=fixed size.

; Pixel-LLM generated: Draw a red pixel
LDI r10, 0x00FF00
LDI r5, 0x0000FF00  ; purple
RECTF r5, r3, r11, r7, r10
LDI r3, 1
LDI r11, 0x4444
LDI r11, 0xFFFFFF
RECTF r11, r7, r7, r7, r0
LDI r20, BUF
LDI r20, TXT_BUF
RECTF r10, r5, r3, r0
LDI r10, 231
LDI r5, 16
LDI r3, 256
LDI r7, 24
LDI r7, 30
RECTF r10, r5, r3, r11, r7
LDI r20, BUF
LDI r20, TXT_BUF
STRO r20, "Size: 8x8"
LDI r5, 1000
TEXT r12, r10, r5, r3, r11
HALT
