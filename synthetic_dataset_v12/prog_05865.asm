; DESCRIPTION: Places a yellow 26x97 rectangle at position (154, 122).
; PLAN: r0=154(x), r1=122(y), r2=26(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 122
LDI r2, 26
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
