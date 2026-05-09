; DESCRIPTION: Draws a green line from (101, 36) to (144, 98).
; PLAN: r0=101(x1), r1=36(y1), r2=144(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 36
LDI r2, 144
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
