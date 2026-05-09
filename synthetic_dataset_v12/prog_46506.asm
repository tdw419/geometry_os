; DESCRIPTION: Renders a green line between points (141, 152) and (2, 184).
; PLAN: r0=141(x1), r1=152(y1), r2=2(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 152
LDI r2, 2
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
