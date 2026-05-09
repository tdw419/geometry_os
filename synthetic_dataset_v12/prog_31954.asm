; DESCRIPTION: Draws a white line from (493, 218) to (427, 88).
; PLAN: r0=493(x1), r1=218(y1), r2=427(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 218
LDI r2, 427
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
