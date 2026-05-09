; DESCRIPTION: Composite: . Then Places a blue 90x28 rectangle at position (90, 66). Then Draws a green circle centered at (75, 154) with radius 50.
; PLAN: r0=90(x), r1=66(y), r2=90(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=75(x), r1=154(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue 90x28 rectangle at position (90, 66).
; PLAN: r0=90(x), r1=66(y), r2=90(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 66
LDI r2, 90
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (75, 154) with radius 50.
; PLAN: r0=75(x), r1=154(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 154
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
