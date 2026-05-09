; DESCRIPTION: Renders a white line between points (252, 235) and (85, 221).
; PLAN: r0=252(x1), r1=235(y1), r2=85(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 235
LDI r2, 85
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
