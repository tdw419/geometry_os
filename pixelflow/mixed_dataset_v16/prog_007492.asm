; DESCRIPTION: Composite: Creates a magenta circular shape at (138, 174) with radius 68 then Draws a red rectangle at (124, 138) with width 62 and height 70.
; PLAN: r0=138(x), r1=174(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x), r6=138(y), r7=62(width), r8=70(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 174
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 138
LDI r7, 62
LDI r8, 70
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
