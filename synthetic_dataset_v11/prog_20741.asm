; DESCRIPTION: Renders a orange box of size 110x31 starting at (13, 24).
; PLAN: r0=13(x), r1=24(y), r2=110(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 24
LDI r2, 110
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
