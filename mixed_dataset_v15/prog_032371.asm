; DESCRIPTION: Renders a red box of size 58x120 starting at (52, 43).
; PLAN: r0=52(x), r1=43(y), r2=58(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 43
LDI r2, 58
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
