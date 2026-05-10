; DESCRIPTION: Renders a white line between points (58, 196) and (407, 89).
; PLAN: r0=58(x1), r1=196(y1), r2=407(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 196
LDI r2, 407
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
