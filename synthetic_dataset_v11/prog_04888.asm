; DESCRIPTION: Composite: . Then Draws a blue circle centered at (149, 106) with radius 29. Then Draws a white rectangle at (164, 126) with width 75 and height 87.
; PLAN: r0=149(x), r1=106(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=164(x), r1=126(y), r2=75(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (149, 106) with radius 29.
; PLAN: r0=149(x), r1=106(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 106
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white rectangle at (164, 126) with width 75 and height 87.
; PLAN: r0=164(x), r1=126(y), r2=75(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 126
LDI r2, 75
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
