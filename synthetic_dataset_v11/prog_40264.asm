; DESCRIPTION: Composite: . Then Draws a white rectangle at (80, 62) with width 60 and height 102. Then Creates a red circular shape at (176, 103) with radius 19.
; PLAN: r0=80(x), r1=62(y), r2=60(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=176(x), r1=103(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white rectangle at (80, 62) with width 60 and height 102.
; PLAN: r0=80(x), r1=62(y), r2=60(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 62
LDI r2, 60
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red circular shape at (176, 103) with radius 19.
; PLAN: r0=176(x), r1=103(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 103
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
