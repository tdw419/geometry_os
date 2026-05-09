; DESCRIPTION: Composite: . Then Creates a white rectangular region at (20, 187) spanning 97 by 26 pixels. Then Creates a green circular shape at (203, 89) with radius 46.
; PLAN: r0=20(x), r1=187(y), r2=97(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=203(x), r1=89(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a white rectangular region at (20, 187) spanning 97 by 26 pixels.
; PLAN: r0=20(x), r1=187(y), r2=97(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 187
LDI r2, 97
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (203, 89) with radius 46.
; PLAN: r0=203(x), r1=89(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 89
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
