; DESCRIPTION: Renders a green line between points (47, 55) and (107, 254).
; PLAN: r0=47(x1), r1=55(y1), r2=107(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 55
LDI r2, 107
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
