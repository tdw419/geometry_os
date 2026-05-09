; DESCRIPTION: Draws a orange line from (8, 230) to (71, 2).
; PLAN: r0=8(x1), r1=230(y1), r2=71(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 230
LDI r2, 71
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
