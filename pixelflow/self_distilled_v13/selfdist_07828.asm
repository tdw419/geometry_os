; DESCRIPTION: Renders a white line segment connecting (385, 152) to (282, 36).
; PLAN: r0=385(x1), r1=152(y1), r2=282(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 152
LDI r2, 282
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
