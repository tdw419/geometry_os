; DESCRIPTION: Renders a white line between points (68, 30) and (186, 152).
; PLAN: r0=68(x1), r1=30(y1), r2=186(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 30
LDI r2, 186
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
