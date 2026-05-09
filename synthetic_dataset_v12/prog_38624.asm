; DESCRIPTION: Draws a green line from (490, 253) to (162, 124).
; PLAN: r0=490(x1), r1=253(y1), r2=162(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 253
LDI r2, 162
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
