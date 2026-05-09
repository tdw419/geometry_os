; DESCRIPTION: Places a magenta line segment connecting (96, 11) to (240, 165).
; PLAN: r0=96(x1), r1=11(y1), r2=240(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 11
LDI r2, 240
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
