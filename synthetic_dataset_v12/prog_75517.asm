; DESCRIPTION: Composite: Renders a white box of size 77x65 starting at (369, 161) then Draws a purple circle centered at (412, 171) with radius 33.
; PLAN: r0=369(x), r1=161(y), r2=77(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x), r6=171(y), r7=33(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 369
LDI r1, 161
LDI r2, 77
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 171
LDI r7, 33
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
