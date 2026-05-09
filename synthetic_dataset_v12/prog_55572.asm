; DESCRIPTION: Renders a red box of size 96x13 starting at (233, 172).
; PLAN: r0=233(x), r1=172(y), r2=96(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 172
LDI r2, 96
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
