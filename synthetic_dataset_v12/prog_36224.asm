; DESCRIPTION: Draws a purple line from (310, 206) to (388, 231).
; PLAN: r0=310(x1), r1=206(y1), r2=388(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 206
LDI r2, 388
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
