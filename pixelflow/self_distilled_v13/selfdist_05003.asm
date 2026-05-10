; DESCRIPTION: Renders a green line segment connecting (370, 11) to (130, 138).
; PLAN: r0=370(x1), r1=11(y1), r2=130(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 11
LDI r2, 130
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
