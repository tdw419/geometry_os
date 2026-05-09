; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (126, 155) spanning 67 by 64 pixels. Then Places a yellow circle of radius 19 at center (22, 235).
; PLAN: r0=126(x), r1=155(y), r2=67(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=22(x), r1=235(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a yellow rectangular region at (126, 155) spanning 67 by 64 pixels.
; PLAN: r0=126(x), r1=155(y), r2=67(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 155
LDI r2, 67
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 19 at center (22, 235).
; PLAN: r0=22(x), r1=235(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 235
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
