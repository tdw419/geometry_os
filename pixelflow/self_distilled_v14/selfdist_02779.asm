; DESCRIPTION: Draws a green line from (340, 88) to (41, 67).
; PLAN: r0=340(x1), r1=88(y1), r2=41(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 88
LDI r2, 41
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
