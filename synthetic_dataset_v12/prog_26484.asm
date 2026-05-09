; DESCRIPTION: Renders a blue line between points (98, 151) and (442, 202).
; PLAN: r0=98(x1), r1=151(y1), r2=442(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 151
LDI r2, 442
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
