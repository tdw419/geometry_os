; DESCRIPTION: Composite: . Then Draws a red circle centered at (100, 185) with radius 59. Then Places a magenta 60x14 rectangle at position (21, 18).
; PLAN: r0=100(x), r1=185(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=21(x), r1=18(y), r2=60(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (100, 185) with radius 59.
; PLAN: r0=100(x), r1=185(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 185
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta 60x14 rectangle at position (21, 18).
; PLAN: r0=21(x), r1=18(y), r2=60(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 18
LDI r2, 60
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
