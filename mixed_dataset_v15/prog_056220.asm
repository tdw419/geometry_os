; DESCRIPTION: Draws a blue line from (284, 97) to (249, 106).
; PLAN: r0=284(x1), r1=97(y1), r2=249(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 97
LDI r2, 249
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
