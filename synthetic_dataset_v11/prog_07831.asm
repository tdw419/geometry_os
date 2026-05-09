; DESCRIPTION: Draws a purple line from (167, 15) to (123, 24).
; PLAN: r0=167(x1), r1=15(y1), r2=123(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 15
LDI r2, 123
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
