; DESCRIPTION: Draws a green line from (375, 192) to (493, 90).
; PLAN: r0=375(x1), r1=192(y1), r2=493(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 192
LDI r2, 493
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
