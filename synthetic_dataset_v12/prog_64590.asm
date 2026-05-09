; DESCRIPTION: Renders a green line between points (421, 49) and (105, 165).
; PLAN: r0=421(x1), r1=49(y1), r2=105(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 49
LDI r2, 105
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
