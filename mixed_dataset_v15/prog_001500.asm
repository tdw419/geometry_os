; DESCRIPTION: Renders a blue line between points (83, 152) and (442, 61).
; PLAN: r0=83(x1), r1=152(y1), r2=442(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 152
LDI r2, 442
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
