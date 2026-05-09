; DESCRIPTION: Renders a orange box of size 14x110 starting at (406, 23).
; PLAN: r0=406(x), r1=23(y), r2=14(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 23
LDI r2, 14
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
