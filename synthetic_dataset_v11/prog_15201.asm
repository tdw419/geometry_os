; DESCRIPTION: Composite: . Then Renders a cyan box of size 59x101 starting at (6, 12). Then Creates a purple circular shape at (124, 194) with radius 16.
; PLAN: r0=6(x), r1=12(y), r2=59(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=124(x), r1=194(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan box of size 59x101 starting at (6, 12).
; PLAN: r0=6(x), r1=12(y), r2=59(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 12
LDI r2, 59
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (124, 194) with radius 16.
; PLAN: r0=124(x), r1=194(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 194
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
