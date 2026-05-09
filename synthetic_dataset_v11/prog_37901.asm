; DESCRIPTION: Places a blue line segment connecting (29, 27) to (254, 249).
; PLAN: r0=29(x1), r1=27(y1), r2=254(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 27
LDI r2, 254
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
