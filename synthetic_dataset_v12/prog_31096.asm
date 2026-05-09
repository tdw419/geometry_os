; DESCRIPTION: Draws a yellow line from (450, 58) to (111, 153).
; PLAN: r0=450(x1), r1=58(y1), r2=111(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 58
LDI r2, 111
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
