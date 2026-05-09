; DESCRIPTION: Renders a orange box of size 62x34 starting at (230, 7).
; PLAN: r0=230(x), r1=7(y), r2=62(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 7
LDI r2, 62
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
