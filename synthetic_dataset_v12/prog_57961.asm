; DESCRIPTION: Renders a purple line between points (383, 129) and (407, 255).
; PLAN: r0=383(x1), r1=129(y1), r2=407(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 129
LDI r2, 407
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
