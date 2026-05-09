; DESCRIPTION: Renders a green line between points (159, 58) and (28, 69).
; PLAN: r0=159(x1), r1=58(y1), r2=28(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 58
LDI r2, 28
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
