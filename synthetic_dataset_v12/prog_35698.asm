; DESCRIPTION: Renders a white line between points (310, 216) and (104, 64).
; PLAN: r0=310(x1), r1=216(y1), r2=104(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 216
LDI r2, 104
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
