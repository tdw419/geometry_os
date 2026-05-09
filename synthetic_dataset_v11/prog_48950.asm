; DESCRIPTION: Renders a white line between points (245, 139) and (128, 191).
; PLAN: r0=245(x1), r1=139(y1), r2=128(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 139
LDI r2, 128
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
