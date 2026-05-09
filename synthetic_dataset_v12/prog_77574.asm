; DESCRIPTION: Composite: Renders a green disk with center (78, 67) and radius 41 then Draws a purple line from (286, 65) to (83, 12) then Sets a single blue pixel at (406, 36).
; PLAN: r0=78(x), r1=67(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x1), r6=65(y1), r7=83(x2), r8=12(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=406(x), r11=36(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 78
LDI r1, 67
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 65
LDI r7, 83
LDI r8, 12
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 36
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
