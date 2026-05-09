; DESCRIPTION: Renders a blue line between points (239, 219) and (254, 134).
; PLAN: r0=239(x1), r1=219(y1), r2=254(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 219
LDI r2, 254
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
