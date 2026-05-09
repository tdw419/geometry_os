; DESCRIPTION: Renders a orange box of size 110x11 starting at (65, 43).
; PLAN: r0=65(x), r1=43(y), r2=110(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 43
LDI r2, 110
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
