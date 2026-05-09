; DESCRIPTION: Draws a black line from (54, 22) to (429, 144).
; PLAN: r0=54(x1), r1=22(y1), r2=429(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 22
LDI r2, 429
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
