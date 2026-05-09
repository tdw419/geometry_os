; DESCRIPTION: Renders a yellow line between points (11, 21) and (160, 219).
; PLAN: r0=11(x1), r1=21(y1), r2=160(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 21
LDI r2, 160
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
