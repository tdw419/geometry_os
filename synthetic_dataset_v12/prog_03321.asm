; DESCRIPTION: Renders a orange box of size 22x96 starting at (347, 15).
; PLAN: r0=347(x), r1=15(y), r2=22(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 15
LDI r2, 22
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
