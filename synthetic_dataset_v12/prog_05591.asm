; DESCRIPTION: Draws a yellow rectangle at (310, 159) with width 42 and height 85.
; PLAN: r0=310(x), r1=159(y), r2=42(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 159
LDI r2, 42
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
