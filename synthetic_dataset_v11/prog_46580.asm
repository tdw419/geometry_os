; DESCRIPTION: Composite: . Then Places a blue 56x28 rectangle at position (148, 98). Then Creates a white circular shape at (169, 170) with radius 35.
; PLAN: r0=148(x), r1=98(y), r2=56(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=169(x), r1=170(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue 56x28 rectangle at position (148, 98).
; PLAN: r0=148(x), r1=98(y), r2=56(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 98
LDI r2, 56
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (169, 170) with radius 35.
; PLAN: r0=169(x), r1=170(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 170
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
