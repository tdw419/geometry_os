; DESCRIPTION: Draws a black line from (344, 187) to (364, 10).
; PLAN: r0=344(x1), r1=187(y1), r2=364(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 187
LDI r2, 364
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
