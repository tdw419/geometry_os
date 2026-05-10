; DESCRIPTION: Composite: Creates a red circular shape at (451, 28) with radius 25 then Draws a blue rectangle at (54, 64) with width 39 and height 68.
; PLAN: r0=451(x), r1=28(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x), r6=64(y), r7=39(width), r8=68(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 451
LDI r1, 28
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 64
LDI r7, 39
LDI r8, 68
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
