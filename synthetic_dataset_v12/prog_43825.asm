; DESCRIPTION: Composite: Places a blue dot at position (42, 236) then Places a orange circle of radius 78 at center (283, 156) then Places a green line segment connecting (282, 224) to (146, 218).
; PLAN: r0=42(x), r1=236(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=283(x), r6=156(y), r7=78(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=282(x1), r11=224(y1), r12=146(x2), r13=218(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 236
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 283
LDI r6, 156
LDI r7, 78
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 282
LDI r11, 224
LDI r12, 146
LDI r13, 218
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
