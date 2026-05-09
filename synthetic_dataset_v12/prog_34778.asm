; DESCRIPTION: Renders a green line between points (337, 250) and (470, 217).
; PLAN: r0=337(x1), r1=250(y1), r2=470(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 250
LDI r2, 470
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
