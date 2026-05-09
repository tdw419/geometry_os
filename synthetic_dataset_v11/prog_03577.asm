; DESCRIPTION: Renders a red box of size 118x17 starting at (87, 122).
; PLAN: r0=87(x), r1=122(y), r2=118(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 122
LDI r2, 118
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
