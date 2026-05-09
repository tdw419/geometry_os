; DESCRIPTION: Renders a orange box of size 43x28 starting at (311, 13).
; PLAN: r0=311(x), r1=13(y), r2=43(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 13
LDI r2, 43
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
