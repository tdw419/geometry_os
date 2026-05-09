; DESCRIPTION: Draws a white line from (101, 10) to (56, 198).
; PLAN: r0=101(x1), r1=10(y1), r2=56(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 10
LDI r2, 56
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
