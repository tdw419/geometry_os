; DESCRIPTION: Composite: . Then Places a black 84x120 rectangle at position (136, 12). Then Creates a magenta circular shape at (160, 122) with radius 64.
; PLAN: r0=136(x), r1=12(y), r2=84(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=160(x), r1=122(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black 84x120 rectangle at position (136, 12).
; PLAN: r0=136(x), r1=12(y), r2=84(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 12
LDI r2, 84
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta circular shape at (160, 122) with radius 64.
; PLAN: r0=160(x), r1=122(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 122
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
