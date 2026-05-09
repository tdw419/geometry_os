; DESCRIPTION: Renders a green line between points (253, 110) and (243, 205).
; PLAN: r0=253(x1), r1=110(y1), r2=243(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 110
LDI r2, 243
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
