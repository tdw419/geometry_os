; DESCRIPTION: Renders a orange box of size 29x102 starting at (73, 34).
; PLAN: r0=73(x), r1=34(y), r2=29(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 34
LDI r2, 29
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
