; DESCRIPTION: Draws a red line from (4, 128) to (122, 198).
; PLAN: r0=4(x1), r1=128(y1), r2=122(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 128
LDI r2, 122
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
