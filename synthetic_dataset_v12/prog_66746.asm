; DESCRIPTION: Renders a orange box of size 100x18 starting at (50, 37).
; PLAN: r0=50(x), r1=37(y), r2=100(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 37
LDI r2, 100
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
