; DESCRIPTION: Renders a orange box of size 115x10 starting at (62, 24).
; PLAN: r0=62(x), r1=24(y), r2=115(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 24
LDI r2, 115
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
