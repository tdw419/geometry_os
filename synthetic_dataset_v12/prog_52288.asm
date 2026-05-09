; DESCRIPTION: Renders a green line between points (151, 53) and (125, 1).
; PLAN: r0=151(x1), r1=53(y1), r2=125(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 53
LDI r2, 125
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
