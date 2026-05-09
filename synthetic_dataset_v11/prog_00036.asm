; DESCRIPTION: Renders a green line between points (80, 46) and (88, 45).
; PLAN: r0=80(x1), r1=46(y1), r2=88(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 46
LDI r2, 88
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
