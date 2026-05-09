; DESCRIPTION: Renders a orange box of size 114x20 starting at (71, 71).
; PLAN: r0=71(x), r1=71(y), r2=114(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 71
LDI r2, 114
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
