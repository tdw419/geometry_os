; DESCRIPTION: Renders a cyan line between points (478, 113) and (463, 146).
; PLAN: r0=478(x1), r1=113(y1), r2=463(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 113
LDI r2, 463
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
