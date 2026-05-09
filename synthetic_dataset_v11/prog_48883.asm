; DESCRIPTION: Composite: . Then Renders a magenta box of size 78x31 starting at (140, 123). Then Creates a white circular shape at (119, 124) with radius 53.
; PLAN: r0=140(x), r1=123(y), r2=78(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=119(x), r1=124(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta box of size 78x31 starting at (140, 123).
; PLAN: r0=140(x), r1=123(y), r2=78(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 123
LDI r2, 78
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (119, 124) with radius 53.
; PLAN: r0=119(x), r1=124(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 124
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
