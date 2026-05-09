; DESCRIPTION: Renders a white line between points (222, 252) and (193, 235).
; PLAN: r0=222(x1), r1=252(y1), r2=193(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 252
LDI r2, 193
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
