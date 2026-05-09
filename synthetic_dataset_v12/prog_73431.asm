; DESCRIPTION: Renders a red box of size 28x81 starting at (139, 155).
; PLAN: r0=139(x), r1=155(y), r2=28(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 155
LDI r2, 28
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
