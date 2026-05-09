; DESCRIPTION: Draws a yellow line from (465, 187) to (338, 101).
; PLAN: r0=465(x1), r1=187(y1), r2=338(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 187
LDI r2, 338
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
