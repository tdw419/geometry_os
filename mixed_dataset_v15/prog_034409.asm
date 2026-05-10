; DESCRIPTION: Renders a black line between points (206, 91) and (297, 250).
; PLAN: r0=206(x1), r1=91(y1), r2=297(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 91
LDI r2, 297
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
