; DESCRIPTION: Places a orange line segment connecting (206, 159) to (87, 69).
; PLAN: r0=206(x1), r1=159(y1), r2=87(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 159
LDI r2, 87
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
