; DESCRIPTION: Renders a orange box of size 13x93 starting at (37, 11).
; PLAN: r0=37(x), r1=11(y), r2=13(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 11
LDI r2, 13
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
