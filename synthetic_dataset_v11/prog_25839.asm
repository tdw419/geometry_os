; DESCRIPTION: Renders a red box of size 81x65 starting at (141, 173).
; PLAN: r0=141(x), r1=173(y), r2=81(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 173
LDI r2, 81
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
