; DESCRIPTION: Renders a orange line between points (48, 224) and (33, 142).
; PLAN: r0=48(x1), r1=224(y1), r2=33(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 224
LDI r2, 33
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
