; DESCRIPTION: Draws a yellow line from (225, 3) to (3, 28).
; PLAN: r0=225(x1), r1=3(y1), r2=3(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 3
LDI r2, 3
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
