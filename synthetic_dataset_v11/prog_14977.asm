; DESCRIPTION: Places a black line segment connecting (149, 134) to (255, 180).
; PLAN: r0=149(x1), r1=134(y1), r2=255(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 134
LDI r2, 255
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
