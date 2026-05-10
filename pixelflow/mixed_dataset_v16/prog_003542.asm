; DESCRIPTION: Draws a black line from (219, 67) to (293, 218).
; PLAN: r0=219(x1), r1=67(y1), r2=293(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 67
LDI r2, 293
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
