; DESCRIPTION: Renders a orange box of size 117x61 starting at (116, 101).
; PLAN: r0=116(x), r1=101(y), r2=117(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 101
LDI r2, 117
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
