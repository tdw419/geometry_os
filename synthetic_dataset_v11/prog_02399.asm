; DESCRIPTION: Renders a white line between points (252, 126) and (148, 165).
; PLAN: r0=252(x1), r1=126(y1), r2=148(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 126
LDI r2, 148
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
