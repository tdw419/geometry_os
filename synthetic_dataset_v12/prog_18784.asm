; DESCRIPTION: Renders a red box of size 21x82 starting at (473, 77).
; PLAN: r0=473(x), r1=77(y), r2=21(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 77
LDI r2, 21
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
