; DESCRIPTION: Composite: . Then Places a blue 34x19 rectangle at position (104, 203). Then Draws a orange circle centered at (90, 92) with radius 50.
; PLAN: r0=104(x), r1=203(y), r2=34(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=90(x), r1=92(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue 34x19 rectangle at position (104, 203).
; PLAN: r0=104(x), r1=203(y), r2=34(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 203
LDI r2, 34
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange circle centered at (90, 92) with radius 50.
; PLAN: r0=90(x), r1=92(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 92
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
