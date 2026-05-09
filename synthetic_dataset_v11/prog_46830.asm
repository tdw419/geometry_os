; DESCRIPTION: Renders a yellow line between points (99, 221) and (1, 177).
; PLAN: r0=99(x1), r1=221(y1), r2=1(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 221
LDI r2, 1
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
