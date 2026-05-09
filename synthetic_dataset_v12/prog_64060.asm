; DESCRIPTION: Places a green line segment connecting (25, 51) to (74, 148).
; PLAN: r0=25(x1), r1=51(y1), r2=74(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 51
LDI r2, 74
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
