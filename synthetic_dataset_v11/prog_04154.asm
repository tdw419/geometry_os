; DESCRIPTION: Draws a yellow line from (3, 3) to (160, 20).
; PLAN: r0=3(x1), r1=3(y1), r2=160(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 3
LDI r2, 160
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
