; DESCRIPTION: Draws a blue line from (182, 163) to (344, 182).
; PLAN: r0=182(x1), r1=163(y1), r2=344(x2), r3=182(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 163
LDI r2, 344
LDI r3, 182
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
