; DESCRIPTION: Draws a green line from (98, 99) to (162, 8).
; PLAN: r0=98(x1), r1=99(y1), r2=162(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 99
LDI r2, 162
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
