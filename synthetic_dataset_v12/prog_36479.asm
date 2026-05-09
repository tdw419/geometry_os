; DESCRIPTION: Draws a orange line from (246, 243) to (225, 182).
; PLAN: r0=246(x1), r1=243(y1), r2=225(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 243
LDI r2, 225
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
