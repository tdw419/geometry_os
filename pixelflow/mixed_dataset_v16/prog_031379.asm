; DESCRIPTION: Renders a white line between points (139, 35) and (170, 239).
; PLAN: r0=139(x1), r1=35(y1), r2=170(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 35
LDI r2, 170
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
