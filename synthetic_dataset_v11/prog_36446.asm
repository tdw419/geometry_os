; DESCRIPTION: Renders a cyan line between points (142, 105) and (8, 122).
; PLAN: r0=142(x1), r1=105(y1), r2=8(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 105
LDI r2, 8
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
