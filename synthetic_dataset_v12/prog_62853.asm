; DESCRIPTION: Draws a orange line from (341, 180) to (226, 68).
; PLAN: r0=341(x1), r1=180(y1), r2=226(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 180
LDI r2, 226
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
