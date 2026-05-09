; DESCRIPTION: Renders a yellow line between points (1, 177) and (221, 146).
; PLAN: r0=1(x1), r1=177(y1), r2=221(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 177
LDI r2, 221
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
