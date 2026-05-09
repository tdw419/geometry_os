; DESCRIPTION: Composite: . Then Creates a blue circular shape at (80, 89) with radius 21. Then Draws a orange rectangle at (211, 12) with width 31 and height 84.
; PLAN: r0=80(x), r1=89(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=211(x), r1=12(y), r2=31(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue circular shape at (80, 89) with radius 21.
; PLAN: r0=80(x), r1=89(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 89
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a orange rectangle at (211, 12) with width 31 and height 84.
; PLAN: r0=211(x), r1=12(y), r2=31(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 12
LDI r2, 31
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
