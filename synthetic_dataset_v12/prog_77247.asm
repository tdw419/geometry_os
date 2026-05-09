; DESCRIPTION: Renders a green line between points (300, 100) and (130, 237).
; PLAN: r0=300(x1), r1=100(y1), r2=130(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 100
LDI r2, 130
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
