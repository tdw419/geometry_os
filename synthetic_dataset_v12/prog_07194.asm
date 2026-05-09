; DESCRIPTION: Draws a green line from (457, 67) to (310, 58).
; PLAN: r0=457(x1), r1=67(y1), r2=310(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 67
LDI r2, 310
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
