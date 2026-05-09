; DESCRIPTION: Renders a purple line between points (306, 149) and (470, 184).
; PLAN: r0=306(x1), r1=149(y1), r2=470(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 149
LDI r2, 470
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
