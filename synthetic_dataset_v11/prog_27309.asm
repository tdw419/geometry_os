; DESCRIPTION: Draws a yellow line from (127, 191) to (126, 67).
; PLAN: r0=127(x1), r1=191(y1), r2=126(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 191
LDI r2, 126
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
