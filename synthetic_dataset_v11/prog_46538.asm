; DESCRIPTION: Composite: . Then Creates a black rectangular region at (126, 230) spanning 107 by 12 pixels. Then Draws a purple circle centered at (210, 38) with radius 32.
; PLAN: r0=126(x), r1=230(y), r2=107(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=210(x), r1=38(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a black rectangular region at (126, 230) spanning 107 by 12 pixels.
; PLAN: r0=126(x), r1=230(y), r2=107(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 230
LDI r2, 107
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (210, 38) with radius 32.
; PLAN: r0=210(x), r1=38(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 38
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
