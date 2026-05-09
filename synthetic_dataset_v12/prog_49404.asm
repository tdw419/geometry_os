; DESCRIPTION: Renders a orange box of size 85x108 starting at (381, 91).
; PLAN: r0=381(x), r1=91(y), r2=85(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 91
LDI r2, 85
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
