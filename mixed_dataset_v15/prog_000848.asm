; DESCRIPTION: Draws a green line from (49, 15) to (183, 13).
; PLAN: r0=49(x1), r1=15(y1), r2=183(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 15
LDI r2, 183
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
