; DESCRIPTION: Draws a yellow line from (493, 9) to (437, 37).
; PLAN: r0=493(x1), r1=9(y1), r2=437(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 9
LDI r2, 437
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
