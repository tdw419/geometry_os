; DESCRIPTION: Renders a red box of size 18x35 starting at (282, 180).
; PLAN: r0=282(x), r1=180(y), r2=18(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 180
LDI r2, 18
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
