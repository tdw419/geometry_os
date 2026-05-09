; DESCRIPTION: Draws a green line from (316, 67) to (442, 108).
; PLAN: r0=316(x1), r1=67(y1), r2=442(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 67
LDI r2, 442
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
