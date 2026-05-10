; DESCRIPTION: Renders a red box of size 90x26 starting at (128, 25).
; PLAN: r0=128(x), r1=25(y), r2=90(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 25
LDI r2, 90
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
