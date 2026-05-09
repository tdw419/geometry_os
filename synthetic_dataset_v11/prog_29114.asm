; DESCRIPTION: Renders a white line between points (175, 104) and (33, 155).
; PLAN: r0=175(x1), r1=104(y1), r2=33(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 104
LDI r2, 33
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
