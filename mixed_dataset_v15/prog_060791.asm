; DESCRIPTION: Draws a yellow line from (358, 25) to (175, 69).
; PLAN: r0=358(x1), r1=25(y1), r2=175(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 25
LDI r2, 175
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
