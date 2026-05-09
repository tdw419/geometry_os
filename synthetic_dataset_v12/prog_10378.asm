; DESCRIPTION: Places a black line segment connecting (349, 198) to (401, 239).
; PLAN: r0=349(x1), r1=198(y1), r2=401(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 198
LDI r2, 401
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
