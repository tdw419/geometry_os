; DESCRIPTION: Draws a yellow line from (191, 125) to (101, 192).
; PLAN: r0=191(x1), r1=125(y1), r2=101(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 125
LDI r2, 101
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
