; DESCRIPTION: Composite: Creates a yellow circular shape at (61, 126) with radius 48 then Renders a orange line between points (332, 75) and (136, 38) then Places a orange dot at position (416, 73).
; PLAN: r0=61(x), r1=126(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x1), r6=75(y1), r7=136(x2), r8=38(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=416(x), r11=73(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 61
LDI r1, 126
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 75
LDI r7, 136
LDI r8, 38
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 416
LDI r11, 73
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
