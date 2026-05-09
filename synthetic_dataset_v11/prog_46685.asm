; DESCRIPTION: Composite: . Then Places a blue 28x101 rectangle at position (192, 118). Then Creates a red circular shape at (44, 191) with radius 34.
; PLAN: r0=192(x), r1=118(y), r2=28(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=44(x), r1=191(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue 28x101 rectangle at position (192, 118).
; PLAN: r0=192(x), r1=118(y), r2=28(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 118
LDI r2, 28
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red circular shape at (44, 191) with radius 34.
; PLAN: r0=44(x), r1=191(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 191
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
