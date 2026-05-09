; DESCRIPTION: Renders a white line between points (114, 189) and (3, 152).
; PLAN: r0=114(x1), r1=189(y1), r2=3(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 189
LDI r2, 3
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
