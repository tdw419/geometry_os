; DESCRIPTION: Draws a orange line from (386, 88) to (159, 236).
; PLAN: r0=386(x1), r1=88(y1), r2=159(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 88
LDI r2, 159
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
