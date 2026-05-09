; DESCRIPTION: Draws a black line from (220, 52) to (158, 87).
; PLAN: r0=220(x1), r1=52(y1), r2=158(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 52
LDI r2, 158
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
