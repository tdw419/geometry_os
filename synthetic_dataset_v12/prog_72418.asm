; DESCRIPTION: Renders a blue line between points (488, 7) and (463, 235).
; PLAN: r0=488(x1), r1=7(y1), r2=463(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 7
LDI r2, 463
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
