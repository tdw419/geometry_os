; DESCRIPTION: Places a purple line segment connecting (464, 122) to (312, 239).
; PLAN: r0=464(x1), r1=122(y1), r2=312(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 122
LDI r2, 312
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
