; DESCRIPTION: Places a orange line segment connecting (69, 205) to (156, 246).
; PLAN: r0=69(x1), r1=205(y1), r2=156(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 205
LDI r2, 156
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
