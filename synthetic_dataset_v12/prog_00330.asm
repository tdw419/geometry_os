; DESCRIPTION: Draws a yellow line from (419, 64) to (96, 11).
; PLAN: r0=419(x1), r1=64(y1), r2=96(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 64
LDI r2, 96
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
