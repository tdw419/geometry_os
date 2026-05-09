; DESCRIPTION: Renders a orange box of size 116x33 starting at (122, 119).
; PLAN: r0=122(x), r1=119(y), r2=116(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 119
LDI r2, 116
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
