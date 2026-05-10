; DESCRIPTION: Composite: Sets a single orange pixel at (100, 71) then Renders a yellow line between points (339, 148) and (501, 107).
; PLAN: r0=100(x), r1=71(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=339(x1), r6=148(y1), r7=501(x2), r8=107(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 71
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 339
LDI r6, 148
LDI r7, 501
LDI r8, 107
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
