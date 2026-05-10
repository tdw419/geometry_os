; DESCRIPTION: Composite: Sets a single orange pixel at (420, 196) then Draws a magenta line from (11, 246) to (169, 156).
; PLAN: r0=420(x), r1=196(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=11(x1), r6=246(y1), r7=169(x2), r8=156(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 196
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 11
LDI r6, 246
LDI r7, 169
LDI r8, 156
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
