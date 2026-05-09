; DESCRIPTION: Places a magenta line segment connecting (103, 159) to (157, 135).
; PLAN: r0=103(x1), r1=159(y1), r2=157(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 159
LDI r2, 157
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
