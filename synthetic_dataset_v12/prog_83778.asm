; DESCRIPTION: Composite: Draws a orange rectangle at (393, 59) with width 34 and height 41 then Creates a magenta circular shape at (99, 38) with radius 38.
; PLAN: r0=393(x), r1=59(y), r2=34(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=38(y), r7=38(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 393
LDI r1, 59
LDI r2, 34
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 38
LDI r7, 38
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
