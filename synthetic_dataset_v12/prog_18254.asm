; DESCRIPTION: Renders a orange box of size 24x25 starting at (310, 100).
; PLAN: r0=310(x), r1=100(y), r2=24(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 100
LDI r2, 24
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
