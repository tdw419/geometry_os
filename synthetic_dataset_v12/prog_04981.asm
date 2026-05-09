; DESCRIPTION: Draws a orange line from (213, 131) to (457, 44).
; PLAN: r0=213(x1), r1=131(y1), r2=457(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 131
LDI r2, 457
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
