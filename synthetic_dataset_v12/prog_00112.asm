; DESCRIPTION: Renders a black line between points (115, 33) and (416, 83).
; PLAN: r0=115(x1), r1=33(y1), r2=416(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 33
LDI r2, 416
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
