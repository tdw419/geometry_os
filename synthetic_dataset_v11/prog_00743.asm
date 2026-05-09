; DESCRIPTION: Renders a white line between points (56, 62) and (15, 32).
; PLAN: r0=56(x1), r1=62(y1), r2=15(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 62
LDI r2, 15
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
