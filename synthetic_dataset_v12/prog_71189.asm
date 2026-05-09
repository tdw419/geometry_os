; DESCRIPTION: Renders a red box of size 114x13 starting at (16, 39).
; PLAN: r0=16(x), r1=39(y), r2=114(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 39
LDI r2, 114
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
