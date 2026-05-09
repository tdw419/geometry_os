; DESCRIPTION: Draws a yellow line from (250, 95) to (467, 64).
; PLAN: r0=250(x1), r1=95(y1), r2=467(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 95
LDI r2, 467
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
