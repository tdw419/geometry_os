; DESCRIPTION: Composite: Sets a single black pixel at (442, 205) then Renders a yellow line between points (357, 124) and (194, 149).
; PLAN: r0=442(x), r1=205(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=357(x1), r6=124(y1), r7=194(x2), r8=149(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 442
LDI r1, 205
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 357
LDI r6, 124
LDI r7, 194
LDI r8, 149
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
