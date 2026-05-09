; DESCRIPTION: Renders a black line between points (108, 21) and (132, 16).
; PLAN: r0=108(x1), r1=21(y1), r2=132(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 21
LDI r2, 132
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
