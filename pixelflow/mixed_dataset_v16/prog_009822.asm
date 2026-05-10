; DESCRIPTION: Creates a yellow filled rectangle of size 26x39 starting at (66, 9).
; PLAN: r0=66(x), r1=9(y), r2=26(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 9
LDI r2, 26
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
