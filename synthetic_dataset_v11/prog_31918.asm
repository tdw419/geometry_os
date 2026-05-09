; DESCRIPTION: Renders a white line between points (160, 86) and (234, 203).
; PLAN: r0=160(x1), r1=86(y1), r2=234(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 86
LDI r2, 234
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
