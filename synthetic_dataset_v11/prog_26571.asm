; DESCRIPTION: Renders a orange box of size 26x36 starting at (187, 95).
; PLAN: r0=187(x), r1=95(y), r2=26(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 95
LDI r2, 26
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
