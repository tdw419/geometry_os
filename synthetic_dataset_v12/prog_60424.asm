; DESCRIPTION: Renders a red box of size 40x49 starting at (354, 102).
; PLAN: r0=354(x), r1=102(y), r2=40(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 102
LDI r2, 40
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
