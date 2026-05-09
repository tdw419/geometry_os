; DESCRIPTION: Draws a yellow line from (228, 198) to (153, 13).
; PLAN: r0=228(x1), r1=198(y1), r2=153(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 198
LDI r2, 153
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
