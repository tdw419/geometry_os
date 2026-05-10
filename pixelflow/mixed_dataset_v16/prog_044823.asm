; DESCRIPTION: Draws a black line from (86, 14) to (329, 84).
; PLAN: r0=86(x1), r1=14(y1), r2=329(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 14
LDI r2, 329
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
