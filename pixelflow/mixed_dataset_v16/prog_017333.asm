; DESCRIPTION: Renders a red box of size 19x81 starting at (471, 142).
; PLAN: r0=471(x), r1=142(y), r2=19(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 142
LDI r2, 19
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
