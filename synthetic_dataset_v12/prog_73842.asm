; DESCRIPTION: Renders a red box of size 62x52 starting at (241, 172).
; PLAN: r0=241(x), r1=172(y), r2=62(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 172
LDI r2, 62
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
