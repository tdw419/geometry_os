; DESCRIPTION: Draws a purple line from (254, 67) to (151, 86).
; PLAN: r0=254(x1), r1=67(y1), r2=151(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 67
LDI r2, 151
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
