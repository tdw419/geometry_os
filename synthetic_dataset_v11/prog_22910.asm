; DESCRIPTION: Draws a orange line from (111, 148) to (165, 47).
; PLAN: r0=111(x1), r1=148(y1), r2=165(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 148
LDI r2, 165
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
