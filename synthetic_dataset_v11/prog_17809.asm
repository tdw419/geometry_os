; DESCRIPTION: Renders a orange box of size 116x82 starting at (108, 172).
; PLAN: r0=108(x), r1=172(y), r2=116(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 172
LDI r2, 116
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
