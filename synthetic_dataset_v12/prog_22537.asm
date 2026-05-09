; DESCRIPTION: Draws a red line from (185, 92) to (16, 219).
; PLAN: r0=185(x1), r1=92(y1), r2=16(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 92
LDI r2, 16
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
