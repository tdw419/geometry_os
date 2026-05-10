; DESCRIPTION: Renders a green line segment connecting (164, 144) to (341, 18).
; PLAN: r0=164(x1), r1=144(y1), r2=341(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 144
LDI r2, 341
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
