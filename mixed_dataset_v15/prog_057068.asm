; DESCRIPTION: Renders a black line between points (188, 112) and (271, 86).
; PLAN: r0=188(x1), r1=112(y1), r2=271(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 112
LDI r2, 271
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
