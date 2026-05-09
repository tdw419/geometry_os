; DESCRIPTION: Draws a orange rectangle at (291, 139) with width 27 and height 42.
; PLAN: r0=291(x), r1=139(y), r2=27(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 139
LDI r2, 27
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
