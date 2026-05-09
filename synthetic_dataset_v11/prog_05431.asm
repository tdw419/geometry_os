; DESCRIPTION: Places a blue line segment connecting (35, 103) to (0, 239).
; PLAN: r0=35(x1), r1=103(y1), r2=0(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 103
LDI r2, 0
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
