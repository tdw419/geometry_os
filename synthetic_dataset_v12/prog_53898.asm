; DESCRIPTION: Renders a green line between points (142, 0) and (289, 48).
; PLAN: r0=142(x1), r1=0(y1), r2=289(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 0
LDI r2, 289
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
