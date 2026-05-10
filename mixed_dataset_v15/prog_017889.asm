; DESCRIPTION: Renders a black line between points (190, 222) and (416, 60).
; PLAN: r0=190(x1), r1=222(y1), r2=416(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 222
LDI r2, 416
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
