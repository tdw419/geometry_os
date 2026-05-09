; DESCRIPTION: Renders a orange box of size 116x99 starting at (384, 72).
; PLAN: r0=384(x), r1=72(y), r2=116(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 72
LDI r2, 116
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
