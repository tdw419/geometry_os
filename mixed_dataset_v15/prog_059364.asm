; DESCRIPTION: Composite: Renders a black disk with center (50, 187) and radius 18 then Places a purple line segment connecting (86, 83) to (501, 171) then Places a black dot at position (357, 247).
; PLAN: r0=50(x), r1=187(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=86(x1), r6=83(y1), r7=501(x2), r8=171(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=357(x), r11=247(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 50
LDI r1, 187
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 86
LDI r6, 83
LDI r7, 501
LDI r8, 171
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 357
LDI r11, 247
LDI r12, 0x000000
PSET r10, r11, r12
HALT
