; DESCRIPTION: Places a orange line segment connecting (209, 154) to (246, 61).
; PLAN: r0=209(x1), r1=154(y1), r2=246(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 154
LDI r2, 246
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
