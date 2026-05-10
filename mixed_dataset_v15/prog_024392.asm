; DESCRIPTION: Draws a purple line from (14, 67) to (178, 33).
; PLAN: r0=14(x1), r1=67(y1), r2=178(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 67
LDI r2, 178
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
