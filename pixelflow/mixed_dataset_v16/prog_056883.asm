; DESCRIPTION: Renders a white line between points (287, 179) and (152, 33).
; PLAN: r0=287(x1), r1=179(y1), r2=152(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 179
LDI r2, 152
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
