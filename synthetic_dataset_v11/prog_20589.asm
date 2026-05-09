; DESCRIPTION: Composite: . Then Creates a white rectangular region at (74, 27) spanning 62 by 81 pixels. Then Places a blue circle of radius 64 at center (94, 84).
; PLAN: r0=74(x), r1=27(y), r2=62(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=94(x), r1=84(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a white rectangular region at (74, 27) spanning 62 by 81 pixels.
; PLAN: r0=74(x), r1=27(y), r2=62(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 27
LDI r2, 62
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue circle of radius 64 at center (94, 84).
; PLAN: r0=94(x), r1=84(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 84
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
