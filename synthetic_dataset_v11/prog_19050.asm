; DESCRIPTION: Draws a yellow line from (13, 40) to (53, 48).
; PLAN: r0=13(x1), r1=40(y1), r2=53(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 40
LDI r2, 53
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
