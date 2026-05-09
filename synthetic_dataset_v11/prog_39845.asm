; DESCRIPTION: Renders a orange box of size 53x39 starting at (72, 172).
; PLAN: r0=72(x), r1=172(y), r2=53(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 172
LDI r2, 53
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
