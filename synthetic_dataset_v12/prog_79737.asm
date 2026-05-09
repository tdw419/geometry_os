; DESCRIPTION: Renders a orange box of size 34x102 starting at (248, 114).
; PLAN: r0=248(x), r1=114(y), r2=34(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 114
LDI r2, 34
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
