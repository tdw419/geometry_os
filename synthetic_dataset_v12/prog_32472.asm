; DESCRIPTION: Renders a red box of size 101x77 starting at (379, 23).
; PLAN: r0=379(x), r1=23(y), r2=101(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 23
LDI r2, 101
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
