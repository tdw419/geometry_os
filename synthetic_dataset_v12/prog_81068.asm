; DESCRIPTION: Draws a green line from (2, 67) to (211, 4).
; PLAN: r0=2(x1), r1=67(y1), r2=211(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 67
LDI r2, 211
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
