; DESCRIPTION: Composite: . Then Renders a purple box of size 115x89 starting at (134, 52). Then Creates a orange circular shape at (89, 150) with radius 48.
; PLAN: r0=134(x), r1=52(y), r2=115(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=89(x), r1=150(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple box of size 115x89 starting at (134, 52).
; PLAN: r0=134(x), r1=52(y), r2=115(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 52
LDI r2, 115
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange circular shape at (89, 150) with radius 48.
; PLAN: r0=89(x), r1=150(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 150
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
