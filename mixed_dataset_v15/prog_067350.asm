; DESCRIPTION: Draws a yellow line from (381, 16) to (366, 37).
; PLAN: r0=381(x1), r1=16(y1), r2=366(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 16
LDI r2, 366
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
