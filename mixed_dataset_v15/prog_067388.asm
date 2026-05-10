; DESCRIPTION: Renders a green line between points (304, 80) and (491, 9).
; PLAN: r0=304(x1), r1=80(y1), r2=491(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 80
LDI r2, 491
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
