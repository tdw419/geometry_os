; DESCRIPTION: Renders a cyan line between points (47, 163) and (400, 119).
; PLAN: r0=47(x1), r1=163(y1), r2=400(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 163
LDI r2, 400
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
