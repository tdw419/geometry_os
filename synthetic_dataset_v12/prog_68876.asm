; DESCRIPTION: Renders a white line between points (442, 17) and (375, 249).
; PLAN: r0=442(x1), r1=17(y1), r2=375(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 17
LDI r2, 375
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
