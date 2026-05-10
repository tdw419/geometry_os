; DESCRIPTION: Draws a orange line from (344, 107) to (11, 166).
; PLAN: r0=344(x1), r1=107(y1), r2=11(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 107
LDI r2, 11
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
