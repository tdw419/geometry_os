; DESCRIPTION: Draws a green line from (137, 220) to (485, 101).
; PLAN: r0=137(x1), r1=220(y1), r2=485(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 220
LDI r2, 485
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
