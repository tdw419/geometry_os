; DESCRIPTION: Draws a orange line from (360, 250) to (247, 44).
; PLAN: r0=360(x1), r1=250(y1), r2=247(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 250
LDI r2, 247
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
