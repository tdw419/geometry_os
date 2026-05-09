; DESCRIPTION: Renders a green line between points (223, 32) and (78, 114).
; PLAN: r0=223(x1), r1=32(y1), r2=78(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 32
LDI r2, 78
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
