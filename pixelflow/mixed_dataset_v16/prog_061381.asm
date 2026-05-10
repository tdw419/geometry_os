; DESCRIPTION: Renders a green line between points (112, 235) and (9, 178).
; PLAN: r0=112(x1), r1=235(y1), r2=9(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 235
LDI r2, 9
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
