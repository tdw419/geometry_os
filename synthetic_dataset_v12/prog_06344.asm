; DESCRIPTION: Renders a blue line between points (191, 196) and (407, 239).
; PLAN: r0=191(x1), r1=196(y1), r2=407(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 196
LDI r2, 407
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
