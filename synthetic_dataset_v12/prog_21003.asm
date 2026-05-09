; DESCRIPTION: Draws a orange line from (100, 230) to (135, 202).
; PLAN: r0=100(x1), r1=230(y1), r2=135(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 230
LDI r2, 135
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
