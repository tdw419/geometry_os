; DESCRIPTION: Renders a green line between points (53, 61) and (234, 25).
; PLAN: r0=53(x1), r1=61(y1), r2=234(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 61
LDI r2, 234
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
