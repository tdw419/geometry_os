; DESCRIPTION: Places a purple line segment connecting (209, 37) to (262, 239).
; PLAN: r0=209(x1), r1=37(y1), r2=262(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 37
LDI r2, 262
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
