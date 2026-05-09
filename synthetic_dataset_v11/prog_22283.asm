; DESCRIPTION: Composite: . Then Creates a blue circular shape at (178, 140) with radius 63. Then Places a green 75x106 rectangle at position (104, 96).
; PLAN: r0=178(x), r1=140(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=104(x), r1=96(y), r2=75(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue circular shape at (178, 140) with radius 63.
; PLAN: r0=178(x), r1=140(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 140
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green 75x106 rectangle at position (104, 96).
; PLAN: r0=104(x), r1=96(y), r2=75(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 96
LDI r2, 75
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
