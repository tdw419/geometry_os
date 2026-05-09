; DESCRIPTION: Places a magenta line segment connecting (352, 26) to (60, 156).
; PLAN: r0=352(x1), r1=26(y1), r2=60(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 26
LDI r2, 60
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
