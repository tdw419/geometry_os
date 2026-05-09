; DESCRIPTION: Places a white line segment connecting (246, 11) to (183, 68).
; PLAN: r0=246(x1), r1=11(y1), r2=183(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 11
LDI r2, 183
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
