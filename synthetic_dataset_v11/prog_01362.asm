; DESCRIPTION: Places a white line segment connecting (121, 108) to (85, 155).
; PLAN: r0=121(x1), r1=108(y1), r2=85(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 108
LDI r2, 85
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
