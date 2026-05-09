; DESCRIPTION: Renders a green line between points (300, 140) and (122, 192).
; PLAN: r0=300(x1), r1=140(y1), r2=122(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 140
LDI r2, 122
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
