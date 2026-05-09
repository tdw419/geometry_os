; DESCRIPTION: Places a black line segment connecting (324, 210) to (271, 19).
; PLAN: r0=324(x1), r1=210(y1), r2=271(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 210
LDI r2, 271
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
