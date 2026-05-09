; DESCRIPTION: Draws a blue line from (430, 117) to (327, 163).
; PLAN: r0=430(x1), r1=117(y1), r2=327(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 117
LDI r2, 327
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
