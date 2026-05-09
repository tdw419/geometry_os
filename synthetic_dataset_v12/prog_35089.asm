; DESCRIPTION: Renders a orange box of size 56x49 starting at (393, 97).
; PLAN: r0=393(x), r1=97(y), r2=56(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 97
LDI r2, 56
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
