; DESCRIPTION: Places a black line segment connecting (126, 132) to (195, 94).
; PLAN: r0=126(x1), r1=132(y1), r2=195(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 132
LDI r2, 195
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
