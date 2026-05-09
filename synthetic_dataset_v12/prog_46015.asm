; DESCRIPTION: Renders a green line between points (385, 46) and (181, 189).
; PLAN: r0=385(x1), r1=46(y1), r2=181(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 46
LDI r2, 181
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
