; DESCRIPTION: Renders a green line between points (86, 130) and (470, 110).
; PLAN: r0=86(x1), r1=130(y1), r2=470(x2), r3=110(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 130
LDI r2, 470
LDI r3, 110
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
