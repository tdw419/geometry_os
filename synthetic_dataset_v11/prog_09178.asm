; DESCRIPTION: Renders a white line between points (222, 235) and (255, 230).
; PLAN: r0=222(x1), r1=235(y1), r2=255(x2), r3=230(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 235
LDI r2, 255
LDI r3, 230
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
