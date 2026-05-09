; DESCRIPTION: Draws a purple line from (284, 90) to (355, 90).
; PLAN: r0=284(x1), r1=90(y1), r2=355(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 90
LDI r2, 355
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
