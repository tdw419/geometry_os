; DESCRIPTION: Places a blue 26x21 rectangle at position (205, 114).
; PLAN: r0=205(x), r1=114(y), r2=26(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 114
LDI r2, 26
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
