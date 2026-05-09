; DESCRIPTION: Places a black line segment connecting (360, 250) to (253, 37).
; PLAN: r0=360(x1), r1=250(y1), r2=253(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 250
LDI r2, 253
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
