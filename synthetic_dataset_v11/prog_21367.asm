; DESCRIPTION: Composite: . Then Draws a green rectangle at (150, 203) with width 10 and height 43. Then Places a orange dot at position (173, 160).
; PLAN: r0=150(x), r1=203(y), r2=10(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=173(x), r1=160(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green rectangle at (150, 203) with width 10 and height 43.
; PLAN: r0=150(x), r1=203(y), r2=10(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 203
LDI r2, 10
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (173, 160).
; PLAN: r0=173(x), r1=160(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 173
LDI r1, 160
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
