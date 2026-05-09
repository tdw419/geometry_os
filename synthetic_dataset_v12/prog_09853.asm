; DESCRIPTION: Draws a orange line from (412, 209) to (182, 121).
; PLAN: r0=412(x1), r1=209(y1), r2=182(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 209
LDI r2, 182
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
