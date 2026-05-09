; DESCRIPTION: Renders a white line between points (84, 41) and (152, 235).
; PLAN: r0=84(x1), r1=41(y1), r2=152(x2), r3=235(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 41
LDI r2, 152
LDI r3, 235
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
