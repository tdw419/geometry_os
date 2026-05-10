; DESCRIPTION: Renders a orange box of size 110x19 starting at (291, 37).
; PLAN: r0=291(x), r1=37(y), r2=110(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 37
LDI r2, 110
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
