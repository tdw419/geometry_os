; DESCRIPTION: Draws a orange line from (240, 243) to (105, 140).
; PLAN: r0=240(x1), r1=243(y1), r2=105(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 243
LDI r2, 105
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
