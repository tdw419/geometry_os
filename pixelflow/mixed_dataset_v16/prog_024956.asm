; DESCRIPTION: Renders a white line between points (177, 178) and (282, 20).
; PLAN: r0=177(x1), r1=178(y1), r2=282(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 178
LDI r2, 282
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
