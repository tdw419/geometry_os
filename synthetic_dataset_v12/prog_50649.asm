; DESCRIPTION: Renders a black line between points (256, 115) and (416, 108).
; PLAN: r0=256(x1), r1=115(y1), r2=416(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 115
LDI r2, 416
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
