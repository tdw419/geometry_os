; DESCRIPTION: Composite: Draws a orange circle centered at (91, 77) with radius 48 then Draws a orange rectangle at (279, 36) with width 66 and height 111.
; PLAN: r0=91(x), r1=77(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x), r6=36(y), r7=66(width), r8=111(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 77
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 36
LDI r7, 66
LDI r8, 111
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
