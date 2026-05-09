; DESCRIPTION: Renders a orange box of size 29x96 starting at (182, 134).
; PLAN: r0=182(x), r1=134(y), r2=29(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 134
LDI r2, 29
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
