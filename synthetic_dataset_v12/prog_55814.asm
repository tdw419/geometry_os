; DESCRIPTION: Renders a orange box of size 58x65 starting at (0, 1).
; PLAN: r0=0(x), r1=1(y), r2=58(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 1
LDI r2, 58
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
