; DESCRIPTION: Renders a black line between points (102, 64) and (80, 39).
; PLAN: r0=102(x1), r1=64(y1), r2=80(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 64
LDI r2, 80
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
