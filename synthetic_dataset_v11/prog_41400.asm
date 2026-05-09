; DESCRIPTION: Renders a orange box of size 49x13 starting at (150, 77).
; PLAN: r0=150(x), r1=77(y), r2=49(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 77
LDI r2, 49
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
