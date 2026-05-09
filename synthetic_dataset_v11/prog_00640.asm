; DESCRIPTION: Renders a yellow line between points (29, 252) and (92, 38).
; PLAN: r0=29(x1), r1=252(y1), r2=92(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 252
LDI r2, 92
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
