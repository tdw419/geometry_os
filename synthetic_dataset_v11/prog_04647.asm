; DESCRIPTION: Renders a white line between points (254, 224) and (233, 14).
; PLAN: r0=254(x1), r1=224(y1), r2=233(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 224
LDI r2, 233
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
