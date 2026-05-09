; DESCRIPTION: Places a black line segment connecting (192, 178) to (400, 239).
; PLAN: r0=192(x1), r1=178(y1), r2=400(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 178
LDI r2, 400
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
