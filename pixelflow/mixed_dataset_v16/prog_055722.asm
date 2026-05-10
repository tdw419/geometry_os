; DESCRIPTION: Renders a green line between points (172, 97) and (233, 82).
; PLAN: r0=172(x1), r1=97(y1), r2=233(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 97
LDI r2, 233
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
