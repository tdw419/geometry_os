; DESCRIPTION: Composite: Draws a magenta circle centered at (236, 78) with radius 23 then Places a red line segment connecting (54, 18) to (138, 132).
; PLAN: r0=236(x), r1=78(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x1), r6=18(y1), r7=138(x2), r8=132(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 78
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 18
LDI r7, 138
LDI r8, 132
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
