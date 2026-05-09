; DESCRIPTION: Composite: Sets a single purple pixel at (4, 77) then Places a magenta line segment connecting (407, 88) to (78, 5).
; PLAN: r0=4(x), r1=77(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=407(x1), r6=88(y1), r7=78(x2), r8=5(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 77
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 407
LDI r6, 88
LDI r7, 78
LDI r8, 5
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
