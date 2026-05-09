; DESCRIPTION: Renders a black line between points (255, 29) and (287, 48).
; PLAN: r0=255(x1), r1=29(y1), r2=287(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 29
LDI r2, 287
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
