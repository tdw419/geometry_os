; DESCRIPTION: Composite: Places a magenta dot at position (217, 148) then Renders a purple line between points (328, 109) and (63, 106).
; PLAN: r0=217(x), r1=148(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=328(x1), r6=109(y1), r7=63(x2), r8=106(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 148
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 328
LDI r6, 109
LDI r7, 63
LDI r8, 106
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
