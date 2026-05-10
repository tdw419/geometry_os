; DESCRIPTION: Renders a orange box of size 19x10 starting at (66, 65).
; PLAN: r0=66(x), r1=65(y), r2=19(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 65
LDI r2, 19
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
