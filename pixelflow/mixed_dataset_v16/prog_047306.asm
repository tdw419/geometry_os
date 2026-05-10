; DESCRIPTION: Renders a orange box of size 114x70 starting at (150, 102).
; PLAN: r0=150(x), r1=102(y), r2=114(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 102
LDI r2, 114
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
