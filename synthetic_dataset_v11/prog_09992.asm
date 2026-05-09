; DESCRIPTION: Renders a blue line between points (150, 235) and (167, 134).
; PLAN: r0=150(x1), r1=235(y1), r2=167(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 235
LDI r2, 167
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
