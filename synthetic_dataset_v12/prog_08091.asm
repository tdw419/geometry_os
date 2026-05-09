; DESCRIPTION: Renders a green line between points (302, 146) and (254, 157).
; PLAN: r0=302(x1), r1=146(y1), r2=254(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 146
LDI r2, 254
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
