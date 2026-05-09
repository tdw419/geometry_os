; DESCRIPTION: Renders a cyan line between points (121, 181) and (43, 118).
; PLAN: r0=121(x1), r1=181(y1), r2=43(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 181
LDI r2, 43
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
