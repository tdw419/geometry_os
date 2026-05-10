; DESCRIPTION: Composite: Places a green line segment connecting (252, 151) to (350, 144) then Places a white 65x66 rectangle at position (249, 119) then Places a magenta circle of radius 62 at center (309, 64).
; PLAN: r0=252(x1), r1=151(y1), r2=350(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=119(y), r7=65(width), r8=66(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=309(x), r11=64(y), r12=62(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 252
LDI r1, 151
LDI r2, 350
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 119
LDI r7, 65
LDI r8, 66
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 309
LDI r11, 64
LDI r12, 62
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
