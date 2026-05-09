; DESCRIPTION: Renders a red box of size 66x28 starting at (427, 64).
; PLAN: r0=427(x), r1=64(y), r2=66(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 64
LDI r2, 66
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
