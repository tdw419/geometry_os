; DESCRIPTION: Renders a orange box of size 114x65 starting at (18, 2).
; PLAN: r0=18(x), r1=2(y), r2=114(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 2
LDI r2, 114
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
