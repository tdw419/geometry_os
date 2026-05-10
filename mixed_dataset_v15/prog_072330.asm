; DESCRIPTION: Places a black line segment connecting (226, 10) to (126, 197).
; PLAN: r0=226(x1), r1=10(y1), r2=126(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 10
LDI r2, 126
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
