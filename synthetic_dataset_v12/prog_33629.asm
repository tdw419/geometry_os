; DESCRIPTION: Renders a white box of size 69x38 starting at (98, 121).
; PLAN: r0=98(x), r1=121(y), r2=69(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 121
LDI r2, 69
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
