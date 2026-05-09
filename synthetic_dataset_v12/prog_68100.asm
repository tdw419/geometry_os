; DESCRIPTION: Draws a black line from (356, 204) to (490, 75).
; PLAN: r0=356(x1), r1=204(y1), r2=490(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 204
LDI r2, 490
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
