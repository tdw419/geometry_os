; DESCRIPTION: Creates a yellow filled rectangle of size 56x25 starting at (203, 87).
; PLAN: r0=203(x), r1=87(y), r2=56(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 87
LDI r2, 56
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
