; DESCRIPTION: Places a black 26x42 rectangle at position (54, 97).
; PLAN: r0=54(x), r1=97(y), r2=26(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 97
LDI r2, 26
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
