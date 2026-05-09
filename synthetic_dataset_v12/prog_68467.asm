; DESCRIPTION: Renders a orange box of size 42x17 starting at (345, 43).
; PLAN: r0=345(x), r1=43(y), r2=42(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 43
LDI r2, 42
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
