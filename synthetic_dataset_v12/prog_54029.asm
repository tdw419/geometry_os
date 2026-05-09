; DESCRIPTION: Composite: Draws a red rectangle at (286, 59) with width 85 and height 37 then Draws a yellow circle centered at (308, 29) with radius 16.
; PLAN: r0=286(x), r1=59(y), r2=85(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=308(x), r6=29(y), r7=16(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 286
LDI r1, 59
LDI r2, 85
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 29
LDI r7, 16
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
