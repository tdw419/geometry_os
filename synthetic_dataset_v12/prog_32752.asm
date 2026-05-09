; DESCRIPTION: Composite: Draws a yellow rectangle at (400, 106) with width 47 and height 106 then Draws a yellow circle centered at (42, 193) with radius 10.
; PLAN: r0=400(x), r1=106(y), r2=47(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=42(x), r6=193(y), r7=10(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 400
LDI r1, 106
LDI r2, 47
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 193
LDI r7, 10
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
