; DESCRIPTION: Renders a black line between points (453, 192) and (168, 6).
; PLAN: r0=453(x1), r1=192(y1), r2=168(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 192
LDI r2, 168
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
