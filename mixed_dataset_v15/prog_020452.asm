; DESCRIPTION: Renders a black line between points (139, 33) and (229, 28).
; PLAN: r0=139(x1), r1=33(y1), r2=229(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 33
LDI r2, 229
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
