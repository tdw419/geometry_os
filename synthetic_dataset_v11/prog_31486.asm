; DESCRIPTION: Draws a yellow line from (69, 60) to (209, 163).
; PLAN: r0=69(x1), r1=60(y1), r2=209(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 60
LDI r2, 209
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
