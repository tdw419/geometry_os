; DESCRIPTION: Renders a white line between points (17, 119) and (210, 207).
; PLAN: r0=17(x1), r1=119(y1), r2=210(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 119
LDI r2, 210
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
