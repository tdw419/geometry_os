; DESCRIPTION: Composite: Places a orange dot at position (401, 175) then Places a black line segment connecting (486, 132) to (322, 138).
; PLAN: r0=401(x), r1=175(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=486(x1), r6=132(y1), r7=322(x2), r8=138(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 175
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 486
LDI r6, 132
LDI r7, 322
LDI r8, 138
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
