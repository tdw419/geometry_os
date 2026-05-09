; DESCRIPTION: Draws a yellow line from (44, 18) to (207, 36).
; PLAN: r0=44(x1), r1=18(y1), r2=207(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 18
LDI r2, 207
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
