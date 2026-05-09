; DESCRIPTION: Places a magenta line segment connecting (501, 159) to (183, 27).
; PLAN: r0=501(x1), r1=159(y1), r2=183(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 159
LDI r2, 183
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
