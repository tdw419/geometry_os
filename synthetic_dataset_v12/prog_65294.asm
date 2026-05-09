; DESCRIPTION: Composite: Renders a yellow line between points (469, 184) and (208, 155) then Places a orange circle of radius 55 at center (79, 55) then Places a magenta dot at position (76, 224).
; PLAN: r0=469(x1), r1=184(y1), r2=208(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=79(x), r6=55(y), r7=55(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=76(x), r11=224(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 469
LDI r1, 184
LDI r2, 208
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 55
LDI r7, 55
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 76
LDI r11, 224
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
