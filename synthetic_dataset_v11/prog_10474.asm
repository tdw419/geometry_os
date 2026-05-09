; DESCRIPTION: Renders a green line between points (3, 100) and (7, 69).
; PLAN: r0=3(x1), r1=100(y1), r2=7(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 100
LDI r2, 7
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
