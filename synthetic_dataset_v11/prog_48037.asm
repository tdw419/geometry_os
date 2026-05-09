; DESCRIPTION: Renders a orange box of size 84x52 starting at (167, 182).
; PLAN: r0=167(x), r1=182(y), r2=84(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 182
LDI r2, 84
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
