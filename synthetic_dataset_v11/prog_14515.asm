; DESCRIPTION: Renders a yellow line between points (53, 208) and (197, 212).
; PLAN: r0=53(x1), r1=208(y1), r2=197(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 208
LDI r2, 197
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
