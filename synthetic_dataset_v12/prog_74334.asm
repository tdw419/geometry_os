; DESCRIPTION: Renders a black line between points (182, 206) and (110, 24).
; PLAN: r0=182(x1), r1=206(y1), r2=110(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 206
LDI r2, 110
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
