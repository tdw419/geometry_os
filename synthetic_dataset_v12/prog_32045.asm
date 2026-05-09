; DESCRIPTION: Renders a orange box of size 35x65 starting at (364, 10).
; PLAN: r0=364(x), r1=10(y), r2=35(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 10
LDI r2, 35
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
