; DESCRIPTION: Draws a purple line from (59, 163) to (173, 98).
; PLAN: r0=59(x1), r1=163(y1), r2=173(x2), r3=98(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 163
LDI r2, 173
LDI r3, 98
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
