; DESCRIPTION: Composite: Sets a single black pixel at (86, 189) then Draws a magenta line from (67, 118) to (117, 200).
; PLAN: r0=86(x), r1=189(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=67(x1), r6=118(y1), r7=117(x2), r8=200(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 189
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 67
LDI r6, 118
LDI r7, 117
LDI r8, 200
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
