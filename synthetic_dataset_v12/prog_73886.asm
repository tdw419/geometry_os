; DESCRIPTION: Renders a green line between points (192, 249) and (499, 112).
; PLAN: r0=192(x1), r1=249(y1), r2=499(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 249
LDI r2, 499
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
