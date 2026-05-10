; DESCRIPTION: Composite: Places a purple dot at position (289, 247) then Renders a black line between points (87, 214) and (78, 21) then Places a cyan circle of radius 71 at center (227, 91).
; PLAN: r0=289(x), r1=247(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=87(x1), r6=214(y1), r7=78(x2), r8=21(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=227(x), r11=91(y), r12=71(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 289
LDI r1, 247
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 87
LDI r6, 214
LDI r7, 78
LDI r8, 21
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 91
LDI r12, 71
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
