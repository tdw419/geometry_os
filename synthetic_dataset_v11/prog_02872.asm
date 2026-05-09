; DESCRIPTION: Renders a red box of size 69x113 starting at (154, 43).
; PLAN: r0=154(x), r1=43(y), r2=69(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 43
LDI r2, 69
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
