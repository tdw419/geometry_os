; DESCRIPTION: Composite: Draws a magenta circle centered at (258, 68) with radius 68 then Renders a orange line between points (474, 202) and (271, 36).
; PLAN: r0=258(x), r1=68(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=474(x1), r6=202(y1), r7=271(x2), r8=36(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 68
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 474
LDI r6, 202
LDI r7, 271
LDI r8, 36
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
