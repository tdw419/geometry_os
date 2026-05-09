; DESCRIPTION: Draws a yellow line from (127, 78) to (15, 170).
; PLAN: r0=127(x1), r1=78(y1), r2=15(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 78
LDI r2, 15
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
