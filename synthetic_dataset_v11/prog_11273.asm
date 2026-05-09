; DESCRIPTION: Composite: . Then Places a green dot at position (109, 48). Then Draws a orange rectangle at (75, 9) with width 67 and height 85.
; PLAN: r0=109(x), r1=48(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=75(x), r1=9(y), r2=67(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (109, 48).
; PLAN: r0=109(x), r1=48(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 48
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a orange rectangle at (75, 9) with width 67 and height 85.
; PLAN: r0=75(x), r1=9(y), r2=67(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 9
LDI r2, 67
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
