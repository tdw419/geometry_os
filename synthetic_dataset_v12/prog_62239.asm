; DESCRIPTION: Composite: Sets a single magenta pixel at (254, 241) then Renders a cyan line between points (34, 130) and (119, 149) then Creates a white circular shape at (332, 96) with radius 54.
; PLAN: r0=254(x), r1=241(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=34(x1), r6=130(y1), r7=119(x2), r8=149(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=332(x), r11=96(y), r12=54(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 254
LDI r1, 241
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 34
LDI r6, 130
LDI r7, 119
LDI r8, 149
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 332
LDI r11, 96
LDI r12, 54
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
