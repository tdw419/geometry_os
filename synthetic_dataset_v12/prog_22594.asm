; DESCRIPTION: Renders a black line between points (153, 39) and (125, 188).
; PLAN: r0=153(x1), r1=39(y1), r2=125(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 39
LDI r2, 125
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
