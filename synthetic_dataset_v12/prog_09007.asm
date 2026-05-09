; DESCRIPTION: Renders a cyan line between points (163, 131) and (244, 133).
; PLAN: r0=163(x1), r1=131(y1), r2=244(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 131
LDI r2, 244
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
