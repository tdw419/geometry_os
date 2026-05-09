; DESCRIPTION: Renders a orange box of size 58x114 starting at (337, 134).
; PLAN: r0=337(x), r1=134(y), r2=58(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 134
LDI r2, 58
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
