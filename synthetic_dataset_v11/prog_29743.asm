; DESCRIPTION: Composite: . Then Renders a red disk with center (67, 64) and radius 30. Then Creates a white rectangular region at (120, 57) spanning 80 by 106 pixels.
; PLAN: r0=67(x), r1=64(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=120(x), r1=57(y), r2=80(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red disk with center (67, 64) and radius 30.
; PLAN: r0=67(x), r1=64(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 64
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a white rectangular region at (120, 57) spanning 80 by 106 pixels.
; PLAN: r0=120(x), r1=57(y), r2=80(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 57
LDI r2, 80
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
