; DESCRIPTION: Composite: Draws a white circle centered at (236, 109) with radius 59 then Draws a orange rectangle at (159, 8) with width 111 and height 77.
; PLAN: r0=236(x), r1=109(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x), r6=8(y), r7=111(width), r8=77(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 109
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 8
LDI r7, 111
LDI r8, 77
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
