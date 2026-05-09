; DESCRIPTION: Places a white line segment connecting (118, 63) to (66, 67).
; PLAN: r0=118(x1), r1=63(y1), r2=66(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 63
LDI r2, 66
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
