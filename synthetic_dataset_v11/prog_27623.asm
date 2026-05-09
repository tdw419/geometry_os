; DESCRIPTION: Composite: . Then Creates a blue circular shape at (56, 28) with radius 16. Then Renders a white box of size 32x78 starting at (41, 54).
; PLAN: r0=56(x), r1=28(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=41(x), r1=54(y), r2=32(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue circular shape at (56, 28) with radius 16.
; PLAN: r0=56(x), r1=28(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 28
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white box of size 32x78 starting at (41, 54).
; PLAN: r0=41(x), r1=54(y), r2=32(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 54
LDI r2, 32
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
