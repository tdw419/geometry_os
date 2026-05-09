; DESCRIPTION: Renders a green line between points (159, 113) and (20, 80).
; PLAN: r0=159(x1), r1=113(y1), r2=20(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 113
LDI r2, 20
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
