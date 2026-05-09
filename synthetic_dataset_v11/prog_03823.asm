; DESCRIPTION: Draws a green line from (49, 81) to (130, 40).
; PLAN: r0=49(x1), r1=81(y1), r2=130(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 81
LDI r2, 130
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
