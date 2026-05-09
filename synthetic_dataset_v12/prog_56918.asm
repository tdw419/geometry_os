; DESCRIPTION: Renders a green line between points (503, 78) and (143, 62).
; PLAN: r0=503(x1), r1=78(y1), r2=143(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 78
LDI r2, 143
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
