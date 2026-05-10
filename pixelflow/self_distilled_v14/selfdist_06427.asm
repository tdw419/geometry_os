; DESCRIPTION: Draws a yellow line from (354, 72) to (158, 63).
; PLAN: r0=354(x1), r1=72(y1), r2=158(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 72
LDI r2, 158
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
