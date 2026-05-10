; DESCRIPTION: Draws a purple line from (236, 206) to (324, 103).
; PLAN: r0=236(x1), r1=206(y1), r2=324(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 206
LDI r2, 324
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
