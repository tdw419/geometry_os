; DESCRIPTION: Composite: Places a magenta circle of radius 13 at center (301, 216) then Draws a blue line from (21, 219) to (438, 56).
; PLAN: r0=301(x), r1=216(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=21(x1), r6=219(y1), r7=438(x2), r8=56(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 216
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 21
LDI r6, 219
LDI r7, 438
LDI r8, 56
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
