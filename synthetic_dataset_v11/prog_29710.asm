; DESCRIPTION: Draws a yellow rectangle at (50, 85) with width 56 and height 91.
; PLAN: r0=50(x), r1=85(y), r2=56(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 85
LDI r2, 56
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
