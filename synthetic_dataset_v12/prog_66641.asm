; DESCRIPTION: Renders a orange box of size 13x95 starting at (153, 1).
; PLAN: r0=153(x), r1=1(y), r2=13(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 1
LDI r2, 13
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
