; DESCRIPTION: Renders a green line between points (503, 76) and (475, 72).
; PLAN: r0=503(x1), r1=76(y1), r2=475(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 76
LDI r2, 475
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
