; DESCRIPTION: Composite: Creates a orange circular shape at (340, 150) with radius 18 then Creates a magenta rectangular region at (132, 84) spanning 25 by 36 pixels.
; PLAN: r0=340(x), r1=150(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=84(y), r7=25(width), r8=36(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 150
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 84
LDI r7, 25
LDI r8, 36
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
