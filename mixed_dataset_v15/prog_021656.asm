; DESCRIPTION: Renders a green line between points (501, 183) and (112, 192).
; PLAN: r0=501(x1), r1=183(y1), r2=112(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 183
LDI r2, 112
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
