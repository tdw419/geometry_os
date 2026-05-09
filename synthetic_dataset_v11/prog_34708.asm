; DESCRIPTION: Renders a green line between points (21, 90) and (194, 140).
; PLAN: r0=21(x1), r1=90(y1), r2=194(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 90
LDI r2, 194
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
