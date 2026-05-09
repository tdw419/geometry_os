; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (214, 32) spanning 30 by 114 pixels. Then Creates a purple circular shape at (179, 178) with radius 71.
; PLAN: r0=214(x), r1=32(y), r2=30(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=179(x), r1=178(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a cyan rectangular region at (214, 32) spanning 30 by 114 pixels.
; PLAN: r0=214(x), r1=32(y), r2=30(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 32
LDI r2, 30
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (179, 178) with radius 71.
; PLAN: r0=179(x), r1=178(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 178
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
