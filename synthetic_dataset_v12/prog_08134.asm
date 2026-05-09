; DESCRIPTION: Draws a orange line from (470, 37) to (486, 88).
; PLAN: r0=470(x1), r1=37(y1), r2=486(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 37
LDI r2, 486
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
