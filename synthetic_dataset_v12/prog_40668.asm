; DESCRIPTION: Composite: Draws a purple circle centered at (151, 127) with radius 74 then Places a yellow line segment connecting (310, 170) to (450, 42).
; PLAN: r0=151(x), r1=127(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=310(x1), r6=170(y1), r7=450(x2), r8=42(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 127
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 310
LDI r6, 170
LDI r7, 450
LDI r8, 42
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
