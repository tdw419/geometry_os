; DESCRIPTION: Composite: Draws a magenta rectangle at (388, 53) with width 33 and height 96 then Draws a cyan circle centered at (218, 136) with radius 80.
; PLAN: r0=388(x), r1=53(y), r2=33(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x), r6=136(y), r7=80(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 388
LDI r1, 53
LDI r2, 33
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 136
LDI r7, 80
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
