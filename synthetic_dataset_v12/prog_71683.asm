; DESCRIPTION: Renders a orange box of size 17x19 starting at (347, 97).
; PLAN: r0=347(x), r1=97(y), r2=17(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 97
LDI r2, 17
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
