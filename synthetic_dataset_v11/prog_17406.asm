; DESCRIPTION: Composite: . Then Creates a white rectangular region at (47, 66) spanning 110 by 95 pixels. Then Creates a green circular shape at (177, 158) with radius 62.
; PLAN: r0=47(x), r1=66(y), r2=110(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=177(x), r1=158(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a white rectangular region at (47, 66) spanning 110 by 95 pixels.
; PLAN: r0=47(x), r1=66(y), r2=110(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 66
LDI r2, 110
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (177, 158) with radius 62.
; PLAN: r0=177(x), r1=158(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 158
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
