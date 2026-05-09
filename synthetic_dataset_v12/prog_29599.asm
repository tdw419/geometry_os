; DESCRIPTION: Draws a black line from (116, 70) to (327, 98).
; PLAN: r0=116(x1), r1=70(y1), r2=327(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 70
LDI r2, 327
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
