; DESCRIPTION: Draws a green line from (244, 88) to (166, 6).
; PLAN: r0=244(x1), r1=88(y1), r2=166(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 88
LDI r2, 166
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
