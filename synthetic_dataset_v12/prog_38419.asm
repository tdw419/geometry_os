; DESCRIPTION: Renders a orange box of size 37x43 starting at (347, 2).
; PLAN: r0=347(x), r1=2(y), r2=37(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 2
LDI r2, 37
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
