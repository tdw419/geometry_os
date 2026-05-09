; DESCRIPTION: Composite: Draws a red rectangle at (103, 7) with width 70 and height 109 then Draws a yellow circle centered at (130, 165) with radius 13.
; PLAN: r0=103(x), r1=7(y), r2=70(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x), r6=165(y), r7=13(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 103
LDI r1, 7
LDI r2, 70
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 165
LDI r7, 13
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
