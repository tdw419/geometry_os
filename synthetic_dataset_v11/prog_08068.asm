; DESCRIPTION: Draws a green line from (113, 67) to (201, 2).
; PLAN: r0=113(x1), r1=67(y1), r2=201(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 67
LDI r2, 201
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
