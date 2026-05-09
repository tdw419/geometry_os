; DESCRIPTION: Composite: Places a magenta circle of radius 38 at center (359, 89) then Draws a black rectangle at (400, 82) with width 95 and height 59.
; PLAN: r0=359(x), r1=89(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=82(y), r7=95(width), r8=59(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 89
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 82
LDI r7, 95
LDI r8, 59
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
