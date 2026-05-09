; DESCRIPTION: Renders a black line between points (212, 135) and (255, 99).
; PLAN: r0=212(x1), r1=135(y1), r2=255(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 135
LDI r2, 255
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
