; DESCRIPTION: Draws a red line from (92, 219) to (162, 226).
; PLAN: r0=92(x1), r1=219(y1), r2=162(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 219
LDI r2, 162
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
