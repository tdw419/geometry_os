; DESCRIPTION: Composite: . Then Creates a black rectangular region at (50, 34) spanning 41 by 112 pixels. Then Draws a green circle centered at (83, 132) with radius 60.
; PLAN: r0=50(x), r1=34(y), r2=41(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=83(x), r1=132(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a black rectangular region at (50, 34) spanning 41 by 112 pixels.
; PLAN: r0=50(x), r1=34(y), r2=41(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 34
LDI r2, 41
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (83, 132) with radius 60.
; PLAN: r0=83(x), r1=132(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 132
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
