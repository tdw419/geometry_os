; DESCRIPTION: Renders a white line between points (141, 87) and (50, 203).
; PLAN: r0=141(x1), r1=87(y1), r2=50(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 87
LDI r2, 50
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
