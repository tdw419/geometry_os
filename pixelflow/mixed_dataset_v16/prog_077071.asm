; DESCRIPTION: Composite: Places a purple dot at position (4, 154) then Places a black line segment connecting (252, 126) to (106, 92).
; PLAN: r0=4(x), r1=154(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=252(x1), r6=126(y1), r7=106(x2), r8=92(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 154
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 252
LDI r6, 126
LDI r7, 106
LDI r8, 92
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
