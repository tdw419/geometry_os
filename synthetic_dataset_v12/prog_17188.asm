; DESCRIPTION: Places a white line segment connecting (115, 165) to (61, 81).
; PLAN: r0=115(x1), r1=165(y1), r2=61(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 165
LDI r2, 61
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
