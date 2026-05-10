; DESCRIPTION: Places a black line segment connecting (416, 70) to (75, 107).
; PLAN: r0=416(x1), r1=70(y1), r2=75(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 70
LDI r2, 75
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
