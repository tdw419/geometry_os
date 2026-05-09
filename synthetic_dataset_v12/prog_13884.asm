; DESCRIPTION: Renders a orange box of size 73x30 starting at (332, 102).
; PLAN: r0=332(x), r1=102(y), r2=73(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 102
LDI r2, 73
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
