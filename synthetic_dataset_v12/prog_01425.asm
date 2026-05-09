; DESCRIPTION: Draws a yellow line from (482, 211) to (28, 15).
; PLAN: r0=482(x1), r1=211(y1), r2=28(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 211
LDI r2, 28
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
