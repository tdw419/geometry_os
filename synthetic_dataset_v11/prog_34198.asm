; DESCRIPTION: Renders a orange box of size 116x35 starting at (13, 213).
; PLAN: r0=13(x), r1=213(y), r2=116(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 213
LDI r2, 116
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
