; DESCRIPTION: Renders a orange box of size 110x14 starting at (391, 222).
; PLAN: r0=391(x), r1=222(y), r2=110(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 222
LDI r2, 110
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
