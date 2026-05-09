; DESCRIPTION: Places a black line segment connecting (432, 222) to (8, 213).
; PLAN: r0=432(x1), r1=222(y1), r2=8(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 222
LDI r2, 8
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
