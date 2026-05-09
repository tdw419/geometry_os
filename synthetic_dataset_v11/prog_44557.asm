; DESCRIPTION: Renders a yellow line between points (184, 208) and (207, 137).
; PLAN: r0=184(x1), r1=208(y1), r2=207(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 208
LDI r2, 207
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
