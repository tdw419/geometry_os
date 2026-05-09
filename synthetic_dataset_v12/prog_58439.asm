; DESCRIPTION: Places a white line segment connecting (255, 132) to (41, 80).
; PLAN: r0=255(x1), r1=132(y1), r2=41(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 132
LDI r2, 41
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
