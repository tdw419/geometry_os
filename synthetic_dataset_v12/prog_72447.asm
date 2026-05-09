; DESCRIPTION: Renders a orange box of size 24x102 starting at (217, 49).
; PLAN: r0=217(x), r1=49(y), r2=24(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 49
LDI r2, 24
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
