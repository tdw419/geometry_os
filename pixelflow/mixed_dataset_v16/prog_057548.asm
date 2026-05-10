; DESCRIPTION: Renders a green line between points (475, 203) and (16, 235).
; PLAN: r0=475(x1), r1=203(y1), r2=16(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 203
LDI r2, 16
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
