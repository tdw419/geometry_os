; DESCRIPTION: Composite: . Then Creates a red rectangular region at (227, 9) spanning 21 by 74 pixels. Then Creates a red circular shape at (117, 129) with radius 64.
; PLAN: r0=227(x), r1=9(y), r2=21(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=117(x), r1=129(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a red rectangular region at (227, 9) spanning 21 by 74 pixels.
; PLAN: r0=227(x), r1=9(y), r2=21(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 9
LDI r2, 21
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red circular shape at (117, 129) with radius 64.
; PLAN: r0=117(x), r1=129(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 129
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
