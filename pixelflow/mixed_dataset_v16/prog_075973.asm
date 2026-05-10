; DESCRIPTION: Draws a yellow line from (28, 92) to (258, 86).
; PLAN: r0=28(x1), r1=92(y1), r2=258(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 92
LDI r2, 258
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
