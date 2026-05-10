; DESCRIPTION: Composite: Draws a magenta rectangle at (409, 43) with width 94 and height 116 then Places a orange line segment connecting (175, 106) to (354, 143).
; PLAN: r0=409(x), r1=43(y), r2=94(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=175(x1), r6=106(y1), r7=354(x2), r8=143(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 43
LDI r2, 94
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 106
LDI r7, 354
LDI r8, 143
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
