; DESCRIPTION: Draws a black line from (173, 207) to (84, 251).
; PLAN: r0=173(x1), r1=207(y1), r2=84(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 207
LDI r2, 84
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
