; DESCRIPTION: Draws a orange line from (40, 33) to (247, 255).
; PLAN: r0=40(x1), r1=33(y1), r2=247(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 33
LDI r2, 247
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
