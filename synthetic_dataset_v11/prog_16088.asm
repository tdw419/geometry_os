; DESCRIPTION: Renders a cyan line between points (119, 8) and (165, 189).
; PLAN: r0=119(x1), r1=8(y1), r2=165(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 8
LDI r2, 165
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
