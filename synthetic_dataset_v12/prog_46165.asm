; DESCRIPTION: Renders a orange line between points (281, 237) and (288, 124).
; PLAN: r0=281(x1), r1=237(y1), r2=288(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 237
LDI r2, 288
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
