; DESCRIPTION: Composite: Places a magenta dot at position (419, 55) then Places a orange line segment connecting (143, 118) to (88, 112).
; PLAN: r0=419(x), r1=55(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=143(x1), r6=118(y1), r7=88(x2), r8=112(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 55
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 143
LDI r6, 118
LDI r7, 88
LDI r8, 112
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
