; DESCRIPTION: Draws a green line from (145, 120) to (383, 88).
; PLAN: r0=145(x1), r1=120(y1), r2=383(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 120
LDI r2, 383
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
