; DESCRIPTION: Draws a magenta line from (15, 39) to (233, 17).
; PLAN: r0=15(x1), r1=39(y1), r2=233(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 39
LDI r2, 233
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
