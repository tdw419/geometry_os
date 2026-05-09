; DESCRIPTION: Places a green line segment connecting (127, 88) to (162, 6).
; PLAN: r0=127(x1), r1=88(y1), r2=162(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 88
LDI r2, 162
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
