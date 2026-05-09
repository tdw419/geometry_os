; DESCRIPTION: Composite: . Then Creates a white rectangular region at (103, 39) spanning 66 by 38 pixels. Then Creates a white circular shape at (125, 124) with radius 75.
; PLAN: r0=103(x), r1=39(y), r2=66(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=125(x), r1=124(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a white rectangular region at (103, 39) spanning 66 by 38 pixels.
; PLAN: r0=103(x), r1=39(y), r2=66(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 39
LDI r2, 66
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (125, 124) with radius 75.
; PLAN: r0=125(x), r1=124(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 124
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
