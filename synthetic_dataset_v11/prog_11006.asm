; DESCRIPTION: Composite: . Then Renders a black disk with center (71, 148) and radius 70. Then Places a magenta 66x106 rectangle at position (78, 14).
; PLAN: r0=71(x), r1=148(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=78(x), r1=14(y), r2=66(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (71, 148) and radius 70.
; PLAN: r0=71(x), r1=148(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 148
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta 66x106 rectangle at position (78, 14).
; PLAN: r0=78(x), r1=14(y), r2=66(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 14
LDI r2, 66
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
