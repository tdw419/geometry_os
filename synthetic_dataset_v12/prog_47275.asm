; DESCRIPTION: Draws a green line from (273, 13) to (138, 97).
; PLAN: r0=273(x1), r1=13(y1), r2=138(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 13
LDI r2, 138
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
