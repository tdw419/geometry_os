; DESCRIPTION: Renders a yellow line between points (47, 152) and (252, 159).
; PLAN: r0=47(x1), r1=152(y1), r2=252(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 152
LDI r2, 252
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
