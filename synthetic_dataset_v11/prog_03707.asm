; DESCRIPTION: Composite: . Then Draws a green rectangle at (85, 78) with width 95 and height 48. Then Places a orange dot at position (16, 14).
; PLAN: r0=85(x), r1=78(y), r2=95(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=16(x), r1=14(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green rectangle at (85, 78) with width 95 and height 48.
; PLAN: r0=85(x), r1=78(y), r2=95(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 78
LDI r2, 95
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (16, 14).
; PLAN: r0=16(x), r1=14(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 14
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
