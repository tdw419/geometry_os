; DESCRIPTION: Composite: . Then Creates a red circular shape at (154, 203) with radius 42. Then Creates a purple rectangular region at (102, 157) spanning 49 by 96 pixels.
; PLAN: r0=154(x), r1=203(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=102(x), r1=157(y), r2=49(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red circular shape at (154, 203) with radius 42.
; PLAN: r0=154(x), r1=203(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 203
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a purple rectangular region at (102, 157) spanning 49 by 96 pixels.
; PLAN: r0=102(x), r1=157(y), r2=49(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 157
LDI r2, 49
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
