; DESCRIPTION: Composite: . Then Creates a red rectangular region at (10, 51) spanning 22 by 100 pixels. Then Creates a white circular shape at (34, 32) with radius 23.
; PLAN: r0=10(x), r1=51(y), r2=22(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=34(x), r1=32(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a red rectangular region at (10, 51) spanning 22 by 100 pixels.
; PLAN: r0=10(x), r1=51(y), r2=22(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 51
LDI r2, 22
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (34, 32) with radius 23.
; PLAN: r0=34(x), r1=32(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 32
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
