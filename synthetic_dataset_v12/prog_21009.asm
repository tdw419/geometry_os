; DESCRIPTION: Renders a white line between points (74, 123) and (72, 34).
; PLAN: r0=74(x1), r1=123(y1), r2=72(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 123
LDI r2, 72
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
