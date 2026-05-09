; DESCRIPTION: Composite: . Then Draws a white rectangle at (91, 2) with width 87 and height 120. Then Creates a purple circular shape at (125, 110) with radius 58.
; PLAN: r0=91(x), r1=2(y), r2=87(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=125(x), r1=110(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white rectangle at (91, 2) with width 87 and height 120.
; PLAN: r0=91(x), r1=2(y), r2=87(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 2
LDI r2, 87
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (125, 110) with radius 58.
; PLAN: r0=125(x), r1=110(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 110
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
