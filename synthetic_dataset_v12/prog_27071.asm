; DESCRIPTION: Renders a red box of size 114x28 starting at (364, 80).
; PLAN: r0=364(x), r1=80(y), r2=114(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 80
LDI r2, 114
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
