; DESCRIPTION: Renders a orange box of size 53x50 starting at (360, 49).
; PLAN: r0=360(x), r1=49(y), r2=53(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 49
LDI r2, 53
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
