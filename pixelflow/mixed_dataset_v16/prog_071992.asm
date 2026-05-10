; DESCRIPTION: Draws a white line from (17, 133) to (344, 176).
; PLAN: r0=17(x1), r1=133(y1), r2=344(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 133
LDI r2, 344
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
