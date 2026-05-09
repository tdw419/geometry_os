; DESCRIPTION: Renders a black line between points (134, 67) and (392, 155).
; PLAN: r0=134(x1), r1=67(y1), r2=392(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 67
LDI r2, 392
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
