; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (105, 170) spanning 38 by 19 pixels. Then Places a white circle of radius 30 at center (47, 43).
; PLAN: r0=105(x), r1=170(y), r2=38(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=47(x), r1=43(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a orange rectangular region at (105, 170) spanning 38 by 19 pixels.
; PLAN: r0=105(x), r1=170(y), r2=38(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 170
LDI r2, 38
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 30 at center (47, 43).
; PLAN: r0=47(x), r1=43(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 43
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
