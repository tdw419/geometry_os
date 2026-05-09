; DESCRIPTION: Renders a white box of size 69x53 starting at (23, 165).
; PLAN: r0=23(x), r1=165(y), r2=69(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 165
LDI r2, 69
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
