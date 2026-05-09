; DESCRIPTION: Composite: . Then Renders a cyan disk with center (172, 26) and radius 23. Then Creates a white rectangular region at (134, 31) spanning 103 by 50 pixels.
; PLAN: r0=172(x), r1=26(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=134(x), r1=31(y), r2=103(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (172, 26) and radius 23.
; PLAN: r0=172(x), r1=26(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 26
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a white rectangular region at (134, 31) spanning 103 by 50 pixels.
; PLAN: r0=134(x), r1=31(y), r2=103(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 31
LDI r2, 103
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
