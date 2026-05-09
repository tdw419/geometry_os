; DESCRIPTION: Renders a purple line between points (440, 251) and (28, 198).
; PLAN: r0=440(x1), r1=251(y1), r2=28(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 251
LDI r2, 28
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
