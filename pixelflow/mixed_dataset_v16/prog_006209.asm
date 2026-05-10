; DESCRIPTION: Composite: Draws a magenta line from (449, 111) to (29, 70) then Draws a orange circle centered at (156, 164) with radius 66.
; PLAN: r0=449(x1), r1=111(y1), r2=29(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=164(y), r7=66(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 449
LDI r1, 111
LDI r2, 29
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 164
LDI r7, 66
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
