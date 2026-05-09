; DESCRIPTION: Renders a cyan line between points (119, 105) and (195, 61).
; PLAN: r0=119(x1), r1=105(y1), r2=195(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 105
LDI r2, 195
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
