; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (192, 197) with radius 56. Then Places a blue 120x111 rectangle at position (19, 18).
; PLAN: r0=192(x), r1=197(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=19(x), r1=18(y), r2=120(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (192, 197) with radius 56.
; PLAN: r0=192(x), r1=197(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 197
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue 120x111 rectangle at position (19, 18).
; PLAN: r0=19(x), r1=18(y), r2=120(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 18
LDI r2, 120
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
