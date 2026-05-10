; DESCRIPTION: Draws a yellow line from (21, 56) to (30, 199).
; PLAN: r0=21(x1), r1=56(y1), r2=30(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 56
LDI r2, 30
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
