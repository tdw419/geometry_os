; DESCRIPTION: Composite: Sets a single magenta pixel at (3, 140) then Draws a purple line from (61, 88) to (203, 83).
; PLAN: r0=3(x), r1=140(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=61(x1), r6=88(y1), r7=203(x2), r8=83(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 140
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 61
LDI r6, 88
LDI r7, 203
LDI r8, 83
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
