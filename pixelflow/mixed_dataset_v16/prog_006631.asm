; DESCRIPTION: Composite: Draws a magenta circle centered at (380, 114) with radius 62 then Draws a blue line from (36, 8) to (93, 22).
; PLAN: r0=380(x), r1=114(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=36(x1), r6=8(y1), r7=93(x2), r8=22(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 380
LDI r1, 114
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 36
LDI r6, 8
LDI r7, 93
LDI r8, 22
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
