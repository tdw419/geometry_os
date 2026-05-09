; DESCRIPTION: Composite: Draws a red circle centered at (285, 67) with radius 33 then Renders a blue box of size 50x84 starting at (292, 125).
; PLAN: r0=285(x), r1=67(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x), r6=125(y), r7=50(width), r8=84(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 285
LDI r1, 67
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 125
LDI r7, 50
LDI r8, 84
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
