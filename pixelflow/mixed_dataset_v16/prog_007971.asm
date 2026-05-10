; DESCRIPTION: Composite: Places a cyan dot at position (357, 30) then Renders a black line between points (77, 191) and (35, 106).
; PLAN: r0=357(x), r1=30(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=77(x1), r6=191(y1), r7=35(x2), r8=106(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 357
LDI r1, 30
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 77
LDI r6, 191
LDI r7, 35
LDI r8, 106
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
