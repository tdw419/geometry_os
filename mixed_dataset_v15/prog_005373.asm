; DESCRIPTION: Draws a orange line from (29, 175) to (111, 182).
; PLAN: r0=29(x1), r1=175(y1), r2=111(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 175
LDI r2, 111
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
