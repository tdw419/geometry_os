; DESCRIPTION: Renders a red box of size 69x83 starting at (43, 91).
; PLAN: r0=43(x), r1=91(y), r2=69(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 91
LDI r2, 69
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
