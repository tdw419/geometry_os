; DESCRIPTION: Draws a purple line from (285, 67) to (109, 132).
; PLAN: r0=285(x1), r1=67(y1), r2=109(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 67
LDI r2, 109
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
