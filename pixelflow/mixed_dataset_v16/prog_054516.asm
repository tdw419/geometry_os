; DESCRIPTION: Renders a yellow line between points (17, 238) and (455, 177).
; PLAN: r0=17(x1), r1=238(y1), r2=455(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 238
LDI r2, 455
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
