; DESCRIPTION: Composite: . Then Renders a black box of size 84x42 starting at (122, 22). Then Places a purple circle of radius 50 at center (200, 64).
; PLAN: r0=122(x), r1=22(y), r2=84(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=200(x), r1=64(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black box of size 84x42 starting at (122, 22).
; PLAN: r0=122(x), r1=22(y), r2=84(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 22
LDI r2, 84
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 50 at center (200, 64).
; PLAN: r0=200(x), r1=64(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 64
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
