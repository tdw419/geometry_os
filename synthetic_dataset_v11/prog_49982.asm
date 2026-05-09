; DESCRIPTION: Renders a red box of size 69x77 starting at (132, 83).
; PLAN: r0=132(x), r1=83(y), r2=69(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 83
LDI r2, 69
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
