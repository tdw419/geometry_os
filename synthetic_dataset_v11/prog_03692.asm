; DESCRIPTION: Composite: . Then Creates a black rectangular region at (207, 89) spanning 11 by 61 pixels. Then Creates a purple circular shape at (198, 114) with radius 10.
; PLAN: r0=207(x), r1=89(y), r2=11(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=198(x), r1=114(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a black rectangular region at (207, 89) spanning 11 by 61 pixels.
; PLAN: r0=207(x), r1=89(y), r2=11(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 89
LDI r2, 11
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (198, 114) with radius 10.
; PLAN: r0=198(x), r1=114(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 114
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
