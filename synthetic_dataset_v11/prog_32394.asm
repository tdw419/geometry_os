; DESCRIPTION: Draws a red line from (15, 183) to (210, 219).
; PLAN: r0=15(x1), r1=183(y1), r2=210(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 183
LDI r2, 210
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
