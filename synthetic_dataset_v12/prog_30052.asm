; DESCRIPTION: Places a black line segment connecting (492, 179) to (243, 97).
; PLAN: r0=492(x1), r1=179(y1), r2=243(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 179
LDI r2, 243
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
