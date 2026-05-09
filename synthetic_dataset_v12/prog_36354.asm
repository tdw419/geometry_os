; DESCRIPTION: Renders a white line between points (20, 203) and (465, 184).
; PLAN: r0=20(x1), r1=203(y1), r2=465(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 203
LDI r2, 465
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
