; DESCRIPTION: Draws a green line from (406, 117) to (17, 88).
; PLAN: r0=406(x1), r1=117(y1), r2=17(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 117
LDI r2, 17
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
