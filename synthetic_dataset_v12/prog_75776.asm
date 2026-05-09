; DESCRIPTION: Renders a orange box of size 35x16 starting at (244, 201).
; PLAN: r0=244(x), r1=201(y), r2=35(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 201
LDI r2, 35
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
