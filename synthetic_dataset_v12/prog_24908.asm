; DESCRIPTION: Renders a orange box of size 47x88 starting at (344, 18).
; PLAN: r0=344(x), r1=18(y), r2=47(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 18
LDI r2, 47
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
