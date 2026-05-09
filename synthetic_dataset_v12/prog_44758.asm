; DESCRIPTION: Renders a black line between points (457, 8) and (70, 186).
; PLAN: r0=457(x1), r1=8(y1), r2=70(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 8
LDI r2, 70
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
