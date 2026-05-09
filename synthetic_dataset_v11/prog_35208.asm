; DESCRIPTION: Renders a orange box of size 16x61 starting at (97, 130).
; PLAN: r0=97(x), r1=130(y), r2=16(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 130
LDI r2, 16
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
