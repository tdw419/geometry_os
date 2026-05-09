; DESCRIPTION: Renders a orange line between points (285, 207) and (330, 219).
; PLAN: r0=285(x1), r1=207(y1), r2=330(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 207
LDI r2, 330
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
