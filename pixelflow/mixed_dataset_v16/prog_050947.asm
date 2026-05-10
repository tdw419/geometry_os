; DESCRIPTION: Draws a yellow line from (342, 181) to (307, 43).
; PLAN: r0=342(x1), r1=181(y1), r2=307(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 181
LDI r2, 307
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
