; DESCRIPTION: Places a magenta line segment connecting (28, 47) to (167, 84).
; PLAN: r0=28(x1), r1=47(y1), r2=167(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 47
LDI r2, 167
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
