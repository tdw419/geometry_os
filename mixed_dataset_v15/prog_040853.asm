; DESCRIPTION: Renders a white line segment connecting (84, 69) to (235, 139).
; PLAN: r0=84(x1), r1=69(y1), r2=235(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 69
LDI r2, 235
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
