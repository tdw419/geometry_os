; DESCRIPTION: Places a blue line segment connecting (321, 130) to (166, 180).
; PLAN: r0=321(x1), r1=130(y1), r2=166(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 130
LDI r2, 166
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
