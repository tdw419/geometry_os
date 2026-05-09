; DESCRIPTION: Renders a green line between points (8, 46) and (181, 133).
; PLAN: r0=8(x1), r1=46(y1), r2=181(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 46
LDI r2, 181
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
