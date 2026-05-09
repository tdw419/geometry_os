; DESCRIPTION: Draws a yellow line from (385, 12) to (468, 114).
; PLAN: r0=385(x1), r1=12(y1), r2=468(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 12
LDI r2, 468
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
