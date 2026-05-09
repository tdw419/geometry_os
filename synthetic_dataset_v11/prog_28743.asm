; DESCRIPTION: Renders a blue line between points (17, 143) and (178, 243).
; PLAN: r0=17(x1), r1=143(y1), r2=178(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 143
LDI r2, 178
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
