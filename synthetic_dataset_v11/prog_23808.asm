; DESCRIPTION: Composite: . Then Places a magenta 55x24 rectangle at position (141, 136). Then Creates a magenta circular shape at (99, 166) with radius 37.
; PLAN: r0=141(x), r1=136(y), r2=55(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=99(x), r1=166(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta 55x24 rectangle at position (141, 136).
; PLAN: r0=141(x), r1=136(y), r2=55(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 136
LDI r2, 55
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta circular shape at (99, 166) with radius 37.
; PLAN: r0=99(x), r1=166(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 166
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
