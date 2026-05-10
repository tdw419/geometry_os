; DESCRIPTION: Composite: Creates a white circular shape at (313, 86) with radius 65 then Draws a yellow rectangle at (322, 195) with width 59 and height 55.
; PLAN: r0=313(x), r1=86(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x), r6=195(y), r7=59(width), r8=55(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 86
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 195
LDI r7, 59
LDI r8, 55
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
