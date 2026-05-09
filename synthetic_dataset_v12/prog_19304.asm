; DESCRIPTION: Draws a yellow line from (418, 13) to (333, 58).
; PLAN: r0=418(x1), r1=13(y1), r2=333(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 13
LDI r2, 333
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
