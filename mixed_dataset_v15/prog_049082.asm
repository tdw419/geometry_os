; DESCRIPTION: Composite: Creates a purple circular shape at (202, 171) with radius 56 then Draws a blue rectangle at (302, 36) with width 35 and height 14.
; PLAN: r0=202(x), r1=171(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=302(x), r6=36(y), r7=35(width), r8=14(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 171
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 302
LDI r6, 36
LDI r7, 35
LDI r8, 14
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
