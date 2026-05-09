; DESCRIPTION: Renders a orange box of size 53x114 starting at (433, 0).
; PLAN: r0=433(x), r1=0(y), r2=53(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 0
LDI r2, 53
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
