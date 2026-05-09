; DESCRIPTION: Draws a green line from (94, 170) to (72, 29).
; PLAN: r0=94(x1), r1=170(y1), r2=72(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 170
LDI r2, 72
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
