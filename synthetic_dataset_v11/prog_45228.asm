; DESCRIPTION: Draws a orange line from (135, 223) to (182, 226).
; PLAN: r0=135(x1), r1=223(y1), r2=182(x2), r3=226(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 223
LDI r2, 182
LDI r3, 226
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
