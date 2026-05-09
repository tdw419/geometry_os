; DESCRIPTION: Renders a white line between points (219, 33) and (117, 17).
; PLAN: r0=219(x1), r1=33(y1), r2=117(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 33
LDI r2, 117
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
