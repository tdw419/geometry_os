; DESCRIPTION: Composite: Sets a single green pixel at (51, 226) then Renders a magenta line between points (173, 9) and (260, 74).
; PLAN: r0=51(x), r1=226(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=173(x1), r6=9(y1), r7=260(x2), r8=74(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 51
LDI r1, 226
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 173
LDI r6, 9
LDI r7, 260
LDI r8, 74
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
