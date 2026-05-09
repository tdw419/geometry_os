; DESCRIPTION: Draws a black line from (156, 76) to (14, 70).
; PLAN: r0=156(x1), r1=76(y1), r2=14(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 76
LDI r2, 14
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
