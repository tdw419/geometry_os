; DESCRIPTION: Renders a green line between points (104, 130) and (130, 131).
; PLAN: r0=104(x1), r1=130(y1), r2=130(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 130
LDI r2, 130
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
