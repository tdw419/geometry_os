; DESCRIPTION: Composite: Places a yellow circle of radius 27 at center (226, 188) then Draws a yellow line from (78, 86) to (158, 205).
; PLAN: r0=226(x), r1=188(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x1), r6=86(y1), r7=158(x2), r8=205(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 188
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 86
LDI r7, 158
LDI r8, 205
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
