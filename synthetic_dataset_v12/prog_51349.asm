; DESCRIPTION: Renders a magenta line between points (287, 35) and (289, 28).
; PLAN: r0=287(x1), r1=35(y1), r2=289(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 35
LDI r2, 289
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
