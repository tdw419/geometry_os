; DESCRIPTION: Renders a black line between points (218, 96) and (40, 142).
; PLAN: r0=218(x1), r1=96(y1), r2=40(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 96
LDI r2, 40
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
