; DESCRIPTION: Composite: . Then Draws a red circle centered at (105, 126) with radius 78. Then Places a blue 83x70 rectangle at position (87, 136).
; PLAN: r0=105(x), r1=126(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=87(x), r1=136(y), r2=83(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (105, 126) with radius 78.
; PLAN: r0=105(x), r1=126(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 126
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue 83x70 rectangle at position (87, 136).
; PLAN: r0=87(x), r1=136(y), r2=83(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 136
LDI r2, 83
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
