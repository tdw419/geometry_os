; DESCRIPTION: Creates a yellow filled rectangle of size 69x97 starting at (303, 87).
; PLAN: r0=303(x), r1=87(y), r2=69(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 87
LDI r2, 69
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
