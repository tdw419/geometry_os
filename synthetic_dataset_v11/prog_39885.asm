; DESCRIPTION: Renders a yellow line between points (4, 241) and (121, 180).
; PLAN: r0=4(x1), r1=241(y1), r2=121(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 241
LDI r2, 121
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
