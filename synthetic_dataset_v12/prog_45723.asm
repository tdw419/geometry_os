; DESCRIPTION: Renders a green line between points (65, 83) and (470, 133).
; PLAN: r0=65(x1), r1=83(y1), r2=470(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 83
LDI r2, 470
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
