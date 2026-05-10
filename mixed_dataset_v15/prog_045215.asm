; DESCRIPTION: Draws a red line from (419, 64) to (337, 64).
; PLAN: r0=419(x1), r1=64(y1), r2=337(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 64
LDI r2, 337
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
