; DESCRIPTION: Draws a green line from (166, 15) to (97, 88).
; PLAN: r0=166(x1), r1=15(y1), r2=97(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 15
LDI r2, 97
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
