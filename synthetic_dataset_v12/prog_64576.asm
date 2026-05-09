; DESCRIPTION: Renders a green line between points (166, 235) and (490, 10).
; PLAN: r0=166(x1), r1=235(y1), r2=490(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 235
LDI r2, 490
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
