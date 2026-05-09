; DESCRIPTION: Composite: . Then Creates a black rectangular region at (54, 203) spanning 50 by 18 pixels. Then Creates a red circular shape at (62, 72) with radius 57.
; PLAN: r0=54(x), r1=203(y), r2=50(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=62(x), r1=72(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a black rectangular region at (54, 203) spanning 50 by 18 pixels.
; PLAN: r0=54(x), r1=203(y), r2=50(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 203
LDI r2, 50
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red circular shape at (62, 72) with radius 57.
; PLAN: r0=62(x), r1=72(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 72
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
