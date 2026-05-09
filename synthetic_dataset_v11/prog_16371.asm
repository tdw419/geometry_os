; DESCRIPTION: Draws a black line from (205, 198) to (240, 231).
; PLAN: r0=205(x1), r1=198(y1), r2=240(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 198
LDI r2, 240
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
