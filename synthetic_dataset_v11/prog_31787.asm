; DESCRIPTION: Draws a yellow line from (226, 21) to (216, 222).
; PLAN: r0=226(x1), r1=21(y1), r2=216(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 21
LDI r2, 216
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
