; DESCRIPTION: Composite: Sets a single red pixel at (86, 196) then Renders a red line between points (505, 196) and (79, 243).
; PLAN: r0=86(x), r1=196(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=505(x1), r6=196(y1), r7=79(x2), r8=243(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 196
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 505
LDI r6, 196
LDI r7, 79
LDI r8, 243
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
