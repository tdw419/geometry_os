; DESCRIPTION: Renders a blue line between points (138, 53) and (197, 170).
; PLAN: r0=138(x1), r1=53(y1), r2=197(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 53
LDI r2, 197
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
