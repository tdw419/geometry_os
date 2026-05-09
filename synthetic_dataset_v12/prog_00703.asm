; DESCRIPTION: Draws a red line from (434, 201) to (381, 114).
; PLAN: r0=434(x1), r1=201(y1), r2=381(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 201
LDI r2, 381
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
