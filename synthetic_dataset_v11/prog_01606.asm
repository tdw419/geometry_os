; DESCRIPTION: Places a orange line segment connecting (166, 108) to (199, 246).
; PLAN: r0=166(x1), r1=108(y1), r2=199(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 108
LDI r2, 199
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
