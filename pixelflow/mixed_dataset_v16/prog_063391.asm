; DESCRIPTION: Renders a orange box of size 110x120 starting at (204, 53).
; PLAN: r0=204(x), r1=53(y), r2=110(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 53
LDI r2, 110
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
