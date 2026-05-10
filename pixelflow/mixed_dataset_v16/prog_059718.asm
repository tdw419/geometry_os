; DESCRIPTION: Draws a orange line from (406, 148) to (57, 168).
; PLAN: r0=406(x1), r1=148(y1), r2=57(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 148
LDI r2, 57
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
