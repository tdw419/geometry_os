; DESCRIPTION: Composite: . Then Creates a red rectangular region at (9, 214) spanning 40 by 28 pixels. Then Creates a purple circular shape at (120, 176) with radius 75.
; PLAN: r0=9(x), r1=214(y), r2=40(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=120(x), r1=176(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a red rectangular region at (9, 214) spanning 40 by 28 pixels.
; PLAN: r0=9(x), r1=214(y), r2=40(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 214
LDI r2, 40
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (120, 176) with radius 75.
; PLAN: r0=120(x), r1=176(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 176
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
