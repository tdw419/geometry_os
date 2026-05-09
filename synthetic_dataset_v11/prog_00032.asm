; DESCRIPTION: Composite: . Then Renders a orange disk with center (195, 216) and radius 23. Then Places a blue 110x110 rectangle at position (94, 69).
; PLAN: r0=195(x), r1=216(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=94(x), r1=69(y), r2=110(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (195, 216) and radius 23.
; PLAN: r0=195(x), r1=216(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 216
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue 110x110 rectangle at position (94, 69).
; PLAN: r0=94(x), r1=69(y), r2=110(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 69
LDI r2, 110
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
