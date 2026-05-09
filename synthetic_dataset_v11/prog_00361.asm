; DESCRIPTION: Renders a orange box of size 84x46 starting at (11, 3).
; PLAN: r0=11(x), r1=3(y), r2=84(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 3
LDI r2, 84
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
