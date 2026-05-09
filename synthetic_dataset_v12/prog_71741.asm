; DESCRIPTION: Renders a orange box of size 96x95 starting at (15, 49).
; PLAN: r0=15(x), r1=49(y), r2=96(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 49
LDI r2, 96
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
