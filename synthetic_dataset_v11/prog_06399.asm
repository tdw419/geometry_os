; DESCRIPTION: Renders a white line between points (233, 2) and (103, 19).
; PLAN: r0=233(x1), r1=2(y1), r2=103(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 2
LDI r2, 103
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
