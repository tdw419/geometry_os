; DESCRIPTION: Draws a black line from (6, 16) to (120, 252).
; PLAN: r0=6(x1), r1=16(y1), r2=120(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 16
LDI r2, 120
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
