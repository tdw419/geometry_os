; DESCRIPTION: Draws a yellow line from (271, 90) to (52, 2).
; PLAN: r0=271(x1), r1=90(y1), r2=52(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 90
LDI r2, 52
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
