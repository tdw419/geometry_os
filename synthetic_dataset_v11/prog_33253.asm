; DESCRIPTION: Renders a orange box of size 47x85 starting at (19, 56).
; PLAN: r0=19(x), r1=56(y), r2=47(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 56
LDI r2, 47
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
