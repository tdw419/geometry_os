; DESCRIPTION: Composite: Places a red circle of radius 52 at center (112, 96) then Draws a orange rectangle at (193, 37) with width 94 and height 58.
; PLAN: r0=112(x), r1=96(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x), r6=37(y), r7=94(width), r8=58(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 96
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 37
LDI r7, 94
LDI r8, 58
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
