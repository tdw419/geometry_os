; DESCRIPTION: Composite: . Then Draws a white circle centered at (60, 43) with radius 35. Then Creates a white rectangular region at (50, 53) spanning 115 by 35 pixels.
; PLAN: r0=60(x), r1=43(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=50(x), r1=53(y), r2=115(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white circle centered at (60, 43) with radius 35.
; PLAN: r0=60(x), r1=43(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 43
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a white rectangular region at (50, 53) spanning 115 by 35 pixels.
; PLAN: r0=50(x), r1=53(y), r2=115(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 53
LDI r2, 115
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
