; DESCRIPTION: Draws a black line from (28, 254) to (94, 195).
; PLAN: r0=28(x1), r1=254(y1), r2=94(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 254
LDI r2, 94
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
