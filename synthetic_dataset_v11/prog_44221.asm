; DESCRIPTION: Renders a green line between points (90, 141) and (163, 172).
; PLAN: r0=90(x1), r1=141(y1), r2=163(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 141
LDI r2, 163
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
