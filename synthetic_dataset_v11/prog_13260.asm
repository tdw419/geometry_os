; DESCRIPTION: Draws a yellow line from (78, 32) to (108, 219).
; PLAN: r0=78(x1), r1=32(y1), r2=108(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 32
LDI r2, 108
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
