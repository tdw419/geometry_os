; DESCRIPTION: Renders a white line between points (102, 60) and (49, 64).
; PLAN: r0=102(x1), r1=60(y1), r2=49(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 60
LDI r2, 49
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
