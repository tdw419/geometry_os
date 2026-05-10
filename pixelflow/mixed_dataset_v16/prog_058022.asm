; DESCRIPTION: Renders a green line between points (491, 59) and (157, 6).
; PLAN: r0=491(x1), r1=59(y1), r2=157(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 59
LDI r2, 157
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
