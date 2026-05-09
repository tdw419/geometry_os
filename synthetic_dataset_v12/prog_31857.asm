; DESCRIPTION: Renders a orange box of size 58x12 starting at (240, 182).
; PLAN: r0=240(x), r1=182(y), r2=58(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 182
LDI r2, 58
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
