; DESCRIPTION: Composite: Places a purple dot at position (93, 52) then Draws a red line from (189, 103) to (331, 216).
; PLAN: r0=93(x), r1=52(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=189(x1), r6=103(y1), r7=331(x2), r8=216(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 52
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 189
LDI r6, 103
LDI r7, 331
LDI r8, 216
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
