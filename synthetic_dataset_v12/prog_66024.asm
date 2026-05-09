; DESCRIPTION: Renders a white line between points (254, 203) and (22, 59).
; PLAN: r0=254(x1), r1=203(y1), r2=22(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 203
LDI r2, 22
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
