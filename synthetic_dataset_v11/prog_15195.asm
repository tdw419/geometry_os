; DESCRIPTION: Composite: . Then Creates a red circular shape at (125, 189) with radius 24. Then Creates a white rectangular region at (12, 68) spanning 109 by 96 pixels.
; PLAN: r0=125(x), r1=189(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=12(x), r1=68(y), r2=109(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red circular shape at (125, 189) with radius 24.
; PLAN: r0=125(x), r1=189(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 189
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a white rectangular region at (12, 68) spanning 109 by 96 pixels.
; PLAN: r0=12(x), r1=68(y), r2=109(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 68
LDI r2, 109
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
