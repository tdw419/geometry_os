; DESCRIPTION: Renders a red box of size 69x12 starting at (105, 180).
; PLAN: r0=105(x), r1=180(y), r2=69(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 180
LDI r2, 69
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
