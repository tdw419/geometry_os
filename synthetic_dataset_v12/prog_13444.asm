; DESCRIPTION: Renders a white line between points (433, 17) and (159, 152).
; PLAN: r0=433(x1), r1=17(y1), r2=159(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 17
LDI r2, 159
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
