; DESCRIPTION: Renders a orange box of size 21x65 starting at (456, 139).
; PLAN: r0=456(x), r1=139(y), r2=21(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 139
LDI r2, 21
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
