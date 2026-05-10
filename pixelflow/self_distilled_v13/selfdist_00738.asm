; DESCRIPTION: Draws a red line from (354, 198) to (24, 30).
; PLAN: r0=354(x1), r1=198(y1), r2=24(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 198
LDI r2, 24
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
