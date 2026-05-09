; DESCRIPTION: Places a yellow line segment connecting (4, 93) to (106, 53).
; PLAN: r0=4(x1), r1=93(y1), r2=106(x2), r3=53(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 93
LDI r2, 106
LDI r3, 53
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
