; DESCRIPTION: Composite: Places a purple 24x59 rectangle at position (201, 180) then Draws a red circle centered at (407, 135) with radius 50.
; PLAN: r0=201(x), r1=180(y), r2=24(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x), r6=135(y), r7=50(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 201
LDI r1, 180
LDI r2, 24
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 135
LDI r7, 50
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
