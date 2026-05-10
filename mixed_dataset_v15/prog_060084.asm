; DESCRIPTION: Renders a blue line between points (400, 176) and (156, 156).
; PLAN: r0=400(x1), r1=176(y1), r2=156(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 176
LDI r2, 156
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
