; DESCRIPTION: Composite: Places a green line segment connecting (78, 1) to (382, 155) then Renders a cyan box of size 84x26 starting at (326, 62) then Creates a white circular shape at (245, 203) with radius 16.
; PLAN: r0=78(x1), r1=1(y1), r2=382(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=62(y), r7=84(width), r8=26(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=245(x), r11=203(y), r12=16(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 78
LDI r1, 1
LDI r2, 382
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 62
LDI r7, 84
LDI r8, 26
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 203
LDI r12, 16
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
