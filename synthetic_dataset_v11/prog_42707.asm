; DESCRIPTION: Composite: . Then Places a magenta circle of radius 64 at center (111, 166). Then Creates a purple rectangular region at (32, 139) spanning 30 by 20 pixels.
; PLAN: r0=111(x), r1=166(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=32(x), r1=139(y), r2=30(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 64 at center (111, 166).
; PLAN: r0=111(x), r1=166(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 166
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a purple rectangular region at (32, 139) spanning 30 by 20 pixels.
; PLAN: r0=32(x), r1=139(y), r2=30(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 139
LDI r2, 30
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
