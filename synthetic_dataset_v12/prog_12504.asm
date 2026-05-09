; DESCRIPTION: Draws a purple line from (327, 206) to (151, 13).
; PLAN: r0=327(x1), r1=206(y1), r2=151(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 206
LDI r2, 151
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
