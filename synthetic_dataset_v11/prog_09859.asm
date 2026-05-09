; DESCRIPTION: Draws a orange line from (90, 153) to (202, 119).
; PLAN: r0=90(x1), r1=153(y1), r2=202(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 153
LDI r2, 202
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
