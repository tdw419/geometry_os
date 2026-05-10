; DESCRIPTION: Composite: Sets a single white pixel at (235, 101) then Renders a magenta line between points (358, 8) and (492, 37).
; PLAN: r0=235(x), r1=101(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=358(x1), r6=8(y1), r7=492(x2), r8=37(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 235
LDI r1, 101
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 358
LDI r6, 8
LDI r7, 492
LDI r8, 37
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
