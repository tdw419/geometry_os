; DESCRIPTION: Renders a green line between points (139, 238) and (107, 196).
; PLAN: r0=139(x1), r1=238(y1), r2=107(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 238
LDI r2, 107
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
