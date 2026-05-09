; DESCRIPTION: Renders a orange box of size 111x53 starting at (29, 53).
; PLAN: r0=29(x), r1=53(y), r2=111(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 53
LDI r2, 111
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
