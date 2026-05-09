; DESCRIPTION: Composite: . Then Places a white circle of radius 57 at center (191, 104). Then Creates a green rectangular region at (175, 140) spanning 76 by 80 pixels.
; PLAN: r0=191(x), r1=104(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=175(x), r1=140(y), r2=76(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 57 at center (191, 104).
; PLAN: r0=191(x), r1=104(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 104
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a green rectangular region at (175, 140) spanning 76 by 80 pixels.
; PLAN: r0=175(x), r1=140(y), r2=76(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 140
LDI r2, 76
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
