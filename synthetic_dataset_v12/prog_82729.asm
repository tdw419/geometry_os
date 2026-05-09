; DESCRIPTION: Places a blue line segment connecting (391, 130) to (300, 21).
; PLAN: r0=391(x1), r1=130(y1), r2=300(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 130
LDI r2, 300
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
