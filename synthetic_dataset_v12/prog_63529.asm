; DESCRIPTION: Renders a white line between points (34, 158) and (346, 87).
; PLAN: r0=34(x1), r1=158(y1), r2=346(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 158
LDI r2, 346
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
