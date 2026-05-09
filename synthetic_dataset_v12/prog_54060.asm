; DESCRIPTION: Renders a yellow line between points (132, 108) and (291, 142).
; PLAN: r0=132(x1), r1=108(y1), r2=291(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 108
LDI r2, 291
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
