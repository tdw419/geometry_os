; DESCRIPTION: Places a blue line segment connecting (154, 130) to (91, 2).
; PLAN: r0=154(x1), r1=130(y1), r2=91(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 130
LDI r2, 91
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
