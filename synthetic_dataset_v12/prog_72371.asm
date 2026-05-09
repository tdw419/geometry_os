; DESCRIPTION: Places a magenta line segment connecting (304, 1) to (313, 52).
; PLAN: r0=304(x1), r1=1(y1), r2=313(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 1
LDI r2, 313
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
