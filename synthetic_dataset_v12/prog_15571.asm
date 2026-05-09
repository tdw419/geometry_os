; DESCRIPTION: Renders a white line between points (52, 24) and (249, 60).
; PLAN: r0=52(x1), r1=24(y1), r2=249(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 24
LDI r2, 249
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
