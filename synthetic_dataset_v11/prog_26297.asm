; DESCRIPTION: Draws a black line from (17, 158) to (60, 231).
; PLAN: r0=17(x1), r1=158(y1), r2=60(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 158
LDI r2, 60
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
