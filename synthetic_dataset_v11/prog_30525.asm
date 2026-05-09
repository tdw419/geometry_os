; DESCRIPTION: Renders a orange box of size 13x82 starting at (93, 22).
; PLAN: r0=93(x), r1=22(y), r2=13(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 22
LDI r2, 13
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
