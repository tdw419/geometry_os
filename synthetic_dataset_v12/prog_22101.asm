; DESCRIPTION: Composite: Renders a white line between points (258, 52) and (420, 78) then Sets a single black pixel at (303, 223).
; PLAN: r0=258(x1), r1=52(y1), r2=420(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=223(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 258
LDI r1, 52
LDI r2, 420
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 223
LDI r7, 0x000000
PSET r5, r6, r7
HALT
