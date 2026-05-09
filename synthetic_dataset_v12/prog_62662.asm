; DESCRIPTION: Renders a white line between points (369, 210) and (69, 104).
; PLAN: r0=369(x1), r1=210(y1), r2=69(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 210
LDI r2, 69
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
