; DESCRIPTION: Draws a yellow line from (69, 59) to (359, 11).
; PLAN: r0=69(x1), r1=59(y1), r2=359(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 59
LDI r2, 359
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
