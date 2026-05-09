; DESCRIPTION: Draws a red line from (148, 35) to (196, 199).
; PLAN: r0=148(x1), r1=35(y1), r2=196(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 35
LDI r2, 196
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
