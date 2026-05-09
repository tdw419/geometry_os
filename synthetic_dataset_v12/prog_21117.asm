; DESCRIPTION: Draws a yellow line from (190, 4) to (482, 132).
; PLAN: r0=190(x1), r1=4(y1), r2=482(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 4
LDI r2, 482
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
