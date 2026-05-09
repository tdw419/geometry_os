; DESCRIPTION: Renders a blue line between points (152, 255) and (199, 5).
; PLAN: r0=152(x1), r1=255(y1), r2=199(x2), r3=5(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 255
LDI r2, 199
LDI r3, 5
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
