; DESCRIPTION: Renders a blue line between points (52, 202) and (240, 159).
; PLAN: r0=52(x1), r1=202(y1), r2=240(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 202
LDI r2, 240
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
