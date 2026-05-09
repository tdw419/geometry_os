; DESCRIPTION: Draws a yellow line from (192, 15) to (197, 72).
; PLAN: r0=192(x1), r1=15(y1), r2=197(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 15
LDI r2, 197
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
