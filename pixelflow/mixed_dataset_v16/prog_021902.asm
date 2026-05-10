; DESCRIPTION: Renders a cyan line between points (188, 121) and (78, 143).
; PLAN: r0=188(x1), r1=121(y1), r2=78(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 121
LDI r2, 78
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
