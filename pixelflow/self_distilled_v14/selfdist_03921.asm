; DESCRIPTION: Draws a orange line from (188, 195) to (143, 175).
; PLAN: r0=188(x1), r1=195(y1), r2=143(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 195
LDI r2, 143
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
