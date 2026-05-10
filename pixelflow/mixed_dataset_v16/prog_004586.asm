; DESCRIPTION: Places a green 101x15 rectangle at position (86, 122).
; PLAN: r0=86(x), r1=122(y), r2=101(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 122
LDI r2, 101
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
