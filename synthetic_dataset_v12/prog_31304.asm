; DESCRIPTION: Renders a orange box of size 24x113 starting at (6, 110).
; PLAN: r0=6(x), r1=110(y), r2=24(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 110
LDI r2, 24
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
