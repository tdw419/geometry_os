; DESCRIPTION: Draws a black line from (87, 85) to (254, 114).
; PLAN: r0=87(x1), r1=85(y1), r2=254(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 85
LDI r2, 254
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
