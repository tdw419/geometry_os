; DESCRIPTION: Draws a yellow line from (19, 98) to (114, 22).
; PLAN: r0=19(x1), r1=98(y1), r2=114(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 98
LDI r2, 114
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
