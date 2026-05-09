; DESCRIPTION: Draws a red line from (256, 92) to (193, 32).
; PLAN: r0=256(x1), r1=92(y1), r2=193(x2), r3=32(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 92
LDI r2, 193
LDI r3, 32
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
