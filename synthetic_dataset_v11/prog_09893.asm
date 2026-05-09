; DESCRIPTION: Renders a black line between points (144, 154) and (144, 184).
; PLAN: r0=144(x1), r1=154(y1), r2=144(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 154
LDI r2, 144
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
