; DESCRIPTION: Renders a cyan line between points (155, 35) and (462, 21).
; PLAN: r0=155(x1), r1=35(y1), r2=462(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 35
LDI r2, 462
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
