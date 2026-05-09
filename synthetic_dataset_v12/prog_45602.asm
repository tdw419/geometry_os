; DESCRIPTION: Renders a red box of size 69x62 starting at (249, 132).
; PLAN: r0=249(x), r1=132(y), r2=69(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 132
LDI r2, 69
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
