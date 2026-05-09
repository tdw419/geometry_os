; DESCRIPTION: Places a black line segment connecting (244, 236) to (145, 213).
; PLAN: r0=244(x1), r1=236(y1), r2=145(x2), r3=213(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 236
LDI r2, 145
LDI r3, 213
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
