; DESCRIPTION: Renders a green line segment connecting (99, 10) to (90, 43).
; PLAN: r0=99(x1), r1=10(y1), r2=90(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 10
LDI r2, 90
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
