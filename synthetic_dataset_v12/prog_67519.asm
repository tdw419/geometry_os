; DESCRIPTION: Renders a white line between points (270, 8) and (133, 24).
; PLAN: r0=270(x1), r1=8(y1), r2=133(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 8
LDI r2, 133
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
