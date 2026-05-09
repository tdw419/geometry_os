; DESCRIPTION: Renders a orange box of size 40x95 starting at (101, 68).
; PLAN: r0=101(x), r1=68(y), r2=40(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 68
LDI r2, 40
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
