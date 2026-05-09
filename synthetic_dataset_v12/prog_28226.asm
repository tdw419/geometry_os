; DESCRIPTION: Renders a orange box of size 17x29 starting at (2, 166).
; PLAN: r0=2(x), r1=166(y), r2=17(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 166
LDI r2, 17
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
