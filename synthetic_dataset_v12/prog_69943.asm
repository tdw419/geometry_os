; DESCRIPTION: Draws a orange line from (111, 60) to (219, 45).
; PLAN: r0=111(x1), r1=60(y1), r2=219(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 60
LDI r2, 219
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
