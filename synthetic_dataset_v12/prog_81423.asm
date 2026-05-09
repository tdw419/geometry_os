; DESCRIPTION: Composite: Sets a single magenta pixel at (9, 3) then Places a red line segment connecting (13, 176) to (262, 191).
; PLAN: r0=9(x), r1=3(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=13(x1), r6=176(y1), r7=262(x2), r8=191(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 9
LDI r1, 3
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 13
LDI r6, 176
LDI r7, 262
LDI r8, 191
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
