; DESCRIPTION: Renders a green line between points (45, 96) and (121, 114).
; PLAN: r0=45(x1), r1=96(y1), r2=121(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 96
LDI r2, 121
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
