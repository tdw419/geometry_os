; DESCRIPTION: Composite: Places a green 13x80 rectangle at position (451, 114) then Draws a magenta circle centered at (397, 109) with radius 54.
; PLAN: r0=451(x), r1=114(y), r2=13(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=397(x), r6=109(y), r7=54(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 451
LDI r1, 114
LDI r2, 13
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 109
LDI r7, 54
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
