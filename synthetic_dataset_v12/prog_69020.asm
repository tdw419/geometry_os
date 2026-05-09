; DESCRIPTION: Renders a green line between points (149, 117) and (245, 148).
; PLAN: r0=149(x1), r1=117(y1), r2=245(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 117
LDI r2, 245
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
