; DESCRIPTION: Draws a orange line from (37, 54) to (48, 219).
; PLAN: r0=37(x1), r1=54(y1), r2=48(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 54
LDI r2, 48
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
