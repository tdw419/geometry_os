; DESCRIPTION: Draws a orange line from (123, 114) to (346, 105).
; PLAN: r0=123(x1), r1=114(y1), r2=346(x2), r3=105(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 114
LDI r2, 346
LDI r3, 105
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
