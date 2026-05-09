; DESCRIPTION: Composite: Draws a orange circle centered at (281, 132) with radius 80 then Renders a magenta box of size 57x13 starting at (430, 177).
; PLAN: r0=281(x), r1=132(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x), r6=177(y), r7=57(width), r8=13(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 281
LDI r1, 132
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 177
LDI r7, 57
LDI r8, 13
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
