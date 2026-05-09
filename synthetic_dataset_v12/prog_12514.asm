; DESCRIPTION: Renders a red box of size 20x102 starting at (431, 71).
; PLAN: r0=431(x), r1=71(y), r2=20(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 71
LDI r2, 20
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
