; DESCRIPTION: Renders a red box of size 83x69 starting at (68, 135).
; PLAN: r0=68(x), r1=135(y), r2=83(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 135
LDI r2, 83
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
