; DESCRIPTION: Renders a white line between points (339, 246) and (33, 21).
; PLAN: r0=339(x1), r1=246(y1), r2=33(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 246
LDI r2, 33
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
