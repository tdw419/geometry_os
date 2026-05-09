; DESCRIPTION: Renders a orange box of size 29x36 starting at (178, 165).
; PLAN: r0=178(x), r1=165(y), r2=29(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 165
LDI r2, 29
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
