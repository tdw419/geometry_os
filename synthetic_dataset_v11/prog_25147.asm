; DESCRIPTION: Renders a orange box of size 52x53 starting at (161, 61).
; PLAN: r0=161(x), r1=61(y), r2=52(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 61
LDI r2, 52
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
