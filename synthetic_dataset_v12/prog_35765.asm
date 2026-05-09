; DESCRIPTION: Places a black line segment connecting (213, 97) to (244, 75).
; PLAN: r0=213(x1), r1=97(y1), r2=244(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 97
LDI r2, 244
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
