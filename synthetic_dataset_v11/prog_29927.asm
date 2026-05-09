; DESCRIPTION: Composite: . Then Creates a purple circular shape at (117, 95) with radius 14. Then Renders a orange box of size 12x21 starting at (103, 116).
; PLAN: r0=117(x), r1=95(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=103(x), r1=116(y), r2=12(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (117, 95) with radius 14.
; PLAN: r0=117(x), r1=95(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 95
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a orange box of size 12x21 starting at (103, 116).
; PLAN: r0=103(x), r1=116(y), r2=12(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 116
LDI r2, 12
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
