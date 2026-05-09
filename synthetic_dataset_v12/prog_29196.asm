; DESCRIPTION: Renders a cyan line between points (296, 110) and (463, 66).
; PLAN: r0=296(x1), r1=110(y1), r2=463(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 110
LDI r2, 463
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
