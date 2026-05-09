; DESCRIPTION: Renders a orange box of size 84x58 starting at (365, 53).
; PLAN: r0=365(x), r1=53(y), r2=84(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 53
LDI r2, 84
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
