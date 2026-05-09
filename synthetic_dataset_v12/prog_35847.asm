; DESCRIPTION: Composite: Draws a magenta circle centered at (276, 101) with radius 59 then Draws a green line from (215, 157) to (43, 138).
; PLAN: r0=276(x), r1=101(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=215(x1), r6=157(y1), r7=43(x2), r8=138(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 101
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 215
LDI r6, 157
LDI r7, 43
LDI r8, 138
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
