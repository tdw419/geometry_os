; DESCRIPTION: Draws a green line from (476, 87) to (36, 4).
; PLAN: r0=476(x1), r1=87(y1), r2=36(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 87
LDI r2, 36
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
