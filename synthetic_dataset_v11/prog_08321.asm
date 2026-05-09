; DESCRIPTION: Draws a yellow line from (185, 245) to (113, 162).
; PLAN: r0=185(x1), r1=245(y1), r2=113(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 245
LDI r2, 113
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
