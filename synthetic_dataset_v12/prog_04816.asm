; DESCRIPTION: Places a magenta line segment connecting (270, 244) to (406, 101).
; PLAN: r0=270(x1), r1=244(y1), r2=406(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 244
LDI r2, 406
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
