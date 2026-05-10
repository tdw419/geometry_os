; DESCRIPTION: Draws a white line from (2, 49) to (279, 252).
; PLAN: r0=2(x1), r1=49(y1), r2=279(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 49
LDI r2, 279
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
