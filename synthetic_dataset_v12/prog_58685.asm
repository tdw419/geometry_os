; DESCRIPTION: Draws a yellow line from (6, 154) to (170, 115).
; PLAN: r0=6(x1), r1=154(y1), r2=170(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 154
LDI r2, 170
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
