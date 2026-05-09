; DESCRIPTION: Draws a yellow line from (510, 37) to (199, 175).
; PLAN: r0=510(x1), r1=37(y1), r2=199(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 37
LDI r2, 199
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
