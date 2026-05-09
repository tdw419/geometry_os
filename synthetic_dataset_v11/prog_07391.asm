; DESCRIPTION: Composite: . Then Renders a green disk with center (183, 155) and radius 37. Then Places a blue 16x70 rectangle at position (100, 38).
; PLAN: r0=183(x), r1=155(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=100(x), r1=38(y), r2=16(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green disk with center (183, 155) and radius 37.
; PLAN: r0=183(x), r1=155(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 155
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue 16x70 rectangle at position (100, 38).
; PLAN: r0=100(x), r1=38(y), r2=16(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 38
LDI r2, 16
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
