; DESCRIPTION: Composite: Draws a orange rectangle at (335, 73) with width 61 and height 65 then Draws a blue circle centered at (456, 44) with radius 36.
; PLAN: r0=335(x), r1=73(y), r2=61(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=44(y), r7=36(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 335
LDI r1, 73
LDI r2, 61
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 44
LDI r7, 36
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
