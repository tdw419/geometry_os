; DESCRIPTION: Draws a yellow line from (164, 67) to (247, 170).
; PLAN: r0=164(x1), r1=67(y1), r2=247(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 67
LDI r2, 247
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
