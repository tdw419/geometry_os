; DESCRIPTION: Places a blue line segment connecting (255, 41) to (60, 184).
; PLAN: r0=255(x1), r1=41(y1), r2=60(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 41
LDI r2, 60
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
