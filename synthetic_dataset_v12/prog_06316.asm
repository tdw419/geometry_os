; DESCRIPTION: Renders a green line between points (167, 4) and (289, 0).
; PLAN: r0=167(x1), r1=4(y1), r2=289(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 4
LDI r2, 289
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
