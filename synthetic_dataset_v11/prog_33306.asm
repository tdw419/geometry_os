; DESCRIPTION: Composite: . Then Places a red 99x60 rectangle at position (84, 48). Then Creates a blue circular shape at (160, 206) with radius 17.
; PLAN: r0=84(x), r1=48(y), r2=99(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=160(x), r1=206(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red 99x60 rectangle at position (84, 48).
; PLAN: r0=84(x), r1=48(y), r2=99(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 48
LDI r2, 99
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (160, 206) with radius 17.
; PLAN: r0=160(x), r1=206(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 206
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
