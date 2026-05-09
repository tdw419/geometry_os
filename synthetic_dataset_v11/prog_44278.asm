; DESCRIPTION: Renders a orange box of size 35x14 starting at (87, 2).
; PLAN: r0=87(x), r1=2(y), r2=35(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 2
LDI r2, 35
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
