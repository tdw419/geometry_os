; DESCRIPTION: Renders a blue line between points (108, 129) and (88, 235).
; PLAN: r0=108(x1), r1=129(y1), r2=88(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 129
LDI r2, 88
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
