; DESCRIPTION: Renders a orange box of size 75x75 starting at (54, 122).
; PLAN: r0=54(x), r1=122(y), r2=75(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 122
LDI r2, 75
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
