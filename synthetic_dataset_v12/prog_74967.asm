; DESCRIPTION: Renders a red box of size 108x65 starting at (282, 15).
; PLAN: r0=282(x), r1=15(y), r2=108(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 15
LDI r2, 108
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
