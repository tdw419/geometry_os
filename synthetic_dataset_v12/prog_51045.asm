; DESCRIPTION: Composite: Places a orange line segment connecting (194, 148) to (286, 74) then Renders a blue disk with center (83, 102) and radius 65 then Places a orange dot at position (54, 91).
; PLAN: r0=194(x1), r1=148(y1), r2=286(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=102(y), r7=65(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=54(x), r11=91(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 194
LDI r1, 148
LDI r2, 286
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 102
LDI r7, 65
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 54
LDI r11, 91
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
