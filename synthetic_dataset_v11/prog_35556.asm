; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (171, 176) with radius 50. Then Creates a white rectangular region at (82, 97) spanning 115 by 94 pixels.
; PLAN: r0=171(x), r1=176(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=82(x), r1=97(y), r2=115(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (171, 176) with radius 50.
; PLAN: r0=171(x), r1=176(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 176
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a white rectangular region at (82, 97) spanning 115 by 94 pixels.
; PLAN: r0=82(x), r1=97(y), r2=115(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 97
LDI r2, 115
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
