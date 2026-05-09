; DESCRIPTION: Renders a green line between points (172, 55) and (148, 24).
; PLAN: r0=172(x1), r1=55(y1), r2=148(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 55
LDI r2, 148
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
