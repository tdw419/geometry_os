; DESCRIPTION: Composite: . Then Places a magenta 110x76 rectangle at position (8, 140). Then Renders a orange disk with center (28, 26) and radius 13.
; PLAN: r0=8(x), r1=140(y), r2=110(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=28(x), r1=26(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a magenta 110x76 rectangle at position (8, 140).
; PLAN: r0=8(x), r1=140(y), r2=110(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 140
LDI r2, 110
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (28, 26) and radius 13.
; PLAN: r0=28(x), r1=26(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 26
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
