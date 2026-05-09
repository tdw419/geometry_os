; DESCRIPTION: Composite: Places a black dot at position (147, 166) then Places a orange line segment connecting (118, 55) to (385, 138).
; PLAN: r0=147(x), r1=166(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=118(x1), r6=55(y1), r7=385(x2), r8=138(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 166
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 118
LDI r6, 55
LDI r7, 385
LDI r8, 138
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
