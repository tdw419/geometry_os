; DESCRIPTION: Renders a orange box of size 113x115 starting at (62, 43).
; PLAN: r0=62(x), r1=43(y), r2=113(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 43
LDI r2, 113
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
