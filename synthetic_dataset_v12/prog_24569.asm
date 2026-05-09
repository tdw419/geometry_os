; DESCRIPTION: Draws a yellow line from (199, 16) to (324, 100).
; PLAN: r0=199(x1), r1=16(y1), r2=324(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 16
LDI r2, 324
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
