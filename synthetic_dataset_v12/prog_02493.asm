; DESCRIPTION: Renders a red box of size 81x82 starting at (12, 8).
; PLAN: r0=12(x), r1=8(y), r2=81(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 8
LDI r2, 81
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
