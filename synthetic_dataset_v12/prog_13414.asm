; DESCRIPTION: Composite: Places a red dot at position (182, 202) then Draws a white line from (118, 118) to (124, 205).
; PLAN: r0=182(x), r1=202(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=118(x1), r6=118(y1), r7=124(x2), r8=205(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 202
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 118
LDI r6, 118
LDI r7, 124
LDI r8, 205
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
