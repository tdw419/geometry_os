; DESCRIPTION: Draws a orange line from (148, 73) to (386, 212).
; PLAN: r0=148(x1), r1=73(y1), r2=386(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 73
LDI r2, 386
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
