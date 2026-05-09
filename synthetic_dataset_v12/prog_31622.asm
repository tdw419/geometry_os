; DESCRIPTION: Renders a white line between points (14, 152) and (85, 8).
; PLAN: r0=14(x1), r1=152(y1), r2=85(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 152
LDI r2, 85
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
