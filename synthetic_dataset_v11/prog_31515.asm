; DESCRIPTION: Composite: . Then Places a blue 78x113 rectangle at position (156, 49). Then Places a orange circle of radius 38 at center (147, 64).
; PLAN: r0=156(x), r1=49(y), r2=78(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=147(x), r1=64(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue 78x113 rectangle at position (156, 49).
; PLAN: r0=156(x), r1=49(y), r2=78(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 49
LDI r2, 78
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 38 at center (147, 64).
; PLAN: r0=147(x), r1=64(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 64
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
