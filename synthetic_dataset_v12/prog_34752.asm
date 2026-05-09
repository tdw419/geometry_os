; DESCRIPTION: Renders a white line between points (159, 147) and (152, 192).
; PLAN: r0=159(x1), r1=147(y1), r2=152(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 147
LDI r2, 152
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
