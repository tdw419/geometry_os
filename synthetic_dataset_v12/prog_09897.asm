; DESCRIPTION: Renders a orange box of size 35x45 starting at (351, 157).
; PLAN: r0=351(x), r1=157(y), r2=35(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 157
LDI r2, 35
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
