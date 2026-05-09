; DESCRIPTION: Places a orange line segment connecting (404, 159) to (11, 50).
; PLAN: r0=404(x1), r1=159(y1), r2=11(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 159
LDI r2, 11
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
