; DESCRIPTION: Renders a cyan line between points (112, 84) and (200, 2).
; PLAN: r0=112(x1), r1=84(y1), r2=200(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 84
LDI r2, 200
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
