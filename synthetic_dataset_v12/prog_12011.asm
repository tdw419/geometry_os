; DESCRIPTION: Places a blue line segment connecting (138, 239) to (71, 216).
; PLAN: r0=138(x1), r1=239(y1), r2=71(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 239
LDI r2, 71
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
