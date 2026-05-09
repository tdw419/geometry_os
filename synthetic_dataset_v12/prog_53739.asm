; DESCRIPTION: Draws a yellow line from (27, 192) to (52, 110).
; PLAN: r0=27(x1), r1=192(y1), r2=52(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 192
LDI r2, 52
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
