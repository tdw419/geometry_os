; DESCRIPTION: Renders a green line between points (116, 244) and (470, 100).
; PLAN: r0=116(x1), r1=244(y1), r2=470(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 244
LDI r2, 470
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
