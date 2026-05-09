; DESCRIPTION: Places a white line segment connecting (95, 163) to (81, 121).
; PLAN: r0=95(x1), r1=163(y1), r2=81(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 163
LDI r2, 81
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
