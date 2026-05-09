; DESCRIPTION: Places a orange line segment connecting (187, 183) to (282, 82).
; PLAN: r0=187(x1), r1=183(y1), r2=282(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 183
LDI r2, 282
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
