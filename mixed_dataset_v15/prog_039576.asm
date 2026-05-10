; DESCRIPTION: Renders a yellow line between points (38, 125) and (397, 69).
; PLAN: r0=38(x1), r1=125(y1), r2=397(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 125
LDI r2, 397
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
